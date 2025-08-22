//
//  DemoScrollTabsView.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 22/08/25.
//

/*
 🔹 1. ScrollViewReader { proxy in ... }

 ScrollViewReader wraps a scroll view and gives us a proxy object.

 That proxy lets us programmatically scroll to a view with a specific .id().

 proxy.scrollTo(tab, anchor: .top)


 Without ScrollViewReader, you can only scroll by dragging. With it, we can scroll when the user taps a tab.

 👉 In our code:

 We have two ScrollViewReaders:

 One for the tab bar (so we can keep the selected tab visible in case tabs overflow horizontally).

 One for the content sections (so we can jump to the section when a tab is tapped).

 🔹 2. GeometryReader { geo in ... }

 A GeometryReader lets us measure a child view’s frame (size and position) in a chosen coordinate space.

 In our case:

 geo.frame(in: .named("scrollView")).minY


 gives the vertical position of each section’s top relative to the whole scroll container (coordinateSpace(name: "scrollView")).

 👉 Why do we need this?
 Because we want to know which section is closest to the top of the scroll view. That’s how we decide which tab should be “active” when the user scrolls manually.

 🔹 3. .coordinateSpace(name: "scrollView")

 By default, GeometryReader measures frames relative to the global screen.

 But we want relative to the scroll container.

 So we define a custom coordinate space:

 ScrollView {
    ...
 }.coordinateSpace(name: "scrollView")


 Now, every geo.frame(in: .named("scrollView")) gives positions inside the scroll view, not the whole screen.

 👉 Example:

 Section A at top → minY = 0

 Section B halfway down → minY = 300

 Section C scrolled partly off → minY = -50

 🔹 4. .onChange(of: geo.frame(...).minY)

 SwiftUI gives us a modifier to react whenever a value changes.

 We attach it to geo.frame(...).minY, so whenever the user scrolls, the system updates the section’s Y-offset.

 👉 This is how we continuously track scroll position.
 Every time the user drags, all section offsets update, and we store them in the ViewModel’s tabOffsets dictionary.

 🔹 5. The ViewModel (DemoScrollViewModel)

 This is the brains:

 selectedTab: The currently active tab. Changes either from a tap or from a scroll.

 tabOffsets: Dictionary mapping each tab → its .minY.

 isDragging: Tells us if the user is currently dragging the scroll.

 isProgrammaticScroll: Tells us if we’re scrolling because of a tab tap (so we don’t “fight” with scroll updates).

 Key function:
 func updateSelectedTab() {
     let targetY: CGFloat = 50 // top reference point
     if let best = tabOffsets.min(by: { abs($0.value - targetY) < abs($1.value - targetY) })?.key {
         selectedTab = best
     }
 }


 Looks at all offsets.

 Picks the section whose top (minY) is closest to 50pt below the nav bar.

 Updates selectedTab.

 👉 This is why as you scroll, the highlighted tab changes smoothly.

 🔹 6. The "two-way sync" logic

 We want both:

 Tap tab → Scroll to section

 Scroll content → Tab update
 */
import SwiftUI

struct DemoScrollTabsView: View {
    
    @StateObject private var viewModel = DemoScrollViewModel()
    @Namespace private var underlineNamespace
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            tabBarView
            
            Divider()
            
            contentSectionsView
        }
    }
    
    // MARK: Tab bar
    private var tabBarView: some View {
        ScrollViewReader { proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(DemoTab.allCases) { tab in
                        VStack(spacing: 4) {
                            Text(tab.rawValue)
                                .font(.headline)
                                .foregroundColor(viewModel.selectedTab == tab ? .pink : .gray)
                            
                            if viewModel.selectedTab == tab {
                                Capsule()
                                    .fill(Color.pink)
                                    .frame(height: 2)
                                    .matchedGeometryEffect(id: "underline", in: underlineNamespace)
                            } else {
                                Color.clear.frame(height: 2)
                            }
                        }
                        .onTapGesture {
                            withAnimation {
                                viewModel.isProgrammaticScroll = true
                                viewModel.selectedTab = tab
                            }
                        }
                        .id(tab)
                    }
                }
                .padding()
            }
            .onChange(of: viewModel.selectedTab) { tab in
                withAnimation {
                    proxy.scrollTo(tab, anchor: .center)
                }
            }
        }
    }
    
    
    // MARK: Content sections
    private var contentSectionsView: some View {
        ScrollViewReader { proxy in
            ScrollView {
                VStack(spacing: 40) {
                    ForEach(DemoTab.allCases) { tab in
                      
                    DemoScrollSectionItem(tab: tab)  // ⬅️ use the new view
                        
          // Mark : So .id(tab) gives each section a unique identity (.one, .two, etc.).
          //proxy.scrollTo(tab, anchor: .top)
         // SwiftUI looks for the view with .id(tab) in the scroll view and scrolls to it.
         //    Without .id, ScrollViewReader wouldn’t know where to scroll.
                        
                /*
                 Think of .id like a “name tag” you stick on each section.
                 Later, when you say:

                          proxy.scrollTo(.three)

                 SwiftUI looks around and says:

                 "Oh! Section .three has that name tag — scroll until it’s at the top." ✅
                 */
                        
                            .id(tab)
                            .background(
                                GeometryReader { geo in
                                    Color.clear
                                        .onChange(of: geo.frame(in: .named("scrollView")).minY) { newY in
                                            viewModel.tabOffsets[tab] = newY
                                            if !viewModel.isProgrammaticScroll {
                                                viewModel.updateSelectedTab()
                                            }
                                        }
                                }
                            )
                    }
                }
                .padding()
            }
            .coordinateSpace(name: "scrollView")
            .onChange(of: viewModel.selectedTab) { tab in
                if viewModel.isProgrammaticScroll {
                    withAnimation {
                        proxy.scrollTo(tab, anchor: .top)
                    }
                    // Reset after animation
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        viewModel.isProgrammaticScroll = false
                    }
                }
            }
            .gesture(
                DragGesture()
                    .onChanged { _ in viewModel.isDragging = true }
                    .onEnded { _ in viewModel.isDragging = false }
            )
        }
    }
    
    private func sectionView(for tab: DemoTab) -> some View {
        VStack(spacing: 16) {
            Text("Section \(tab.rawValue)")
                .font(.title)
                .fontWeight(.bold)
            
            ForEach(1...5, id: \.self) { i in
                Text("Item \(i) in \(tab.rawValue)")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 2)
    }
    
}

#Preview {
    DemoScrollTabsView()
}
