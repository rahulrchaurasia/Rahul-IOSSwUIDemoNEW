//
//  SimpleParallaxDemo.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 08/01/25.
//

import SwiftUI


import SwiftUI

class ScrollViewModel: ObservableObject {
    @Published var scrollOffset: CGFloat = 0
}

struct SimpleParallaxDemo: View {
    @StateObject private var scrollData = ScrollViewModel()
    @Environment(\.colorScheme) var scheme
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0, pinnedViews: [.sectionHeaders]) {
                // Parallax Header Image
                GeometryReader { geo -> AnyView in
                    let offset = geo.frame(in: .global).minY
                    
                    DispatchQueue.main.async {
                        scrollData.scrollOffset = -offset
                    }
                    
                    return AnyView(
                        Image("food")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: UIScreen.main.bounds.width,
                                  height: 250 + (offset > 0 ? offset : 0))
                            .offset(y: (offset > 0 ? -offset : 0))
                            .overlay(
                                HStack {
                                    Button(action: {}, label: {
                                        Image(systemName: "arrow.left")
                                            .font(.system(size: 20, weight: .bold))
                                            .foregroundColor(.white)
                                    })
                                    Spacer()
                                }
                                .padding()
                                .opacity(scrollData.scrollOffset > 200 ? 0 : 1)
                                , alignment: .top
                            )
                    )
                }
                .frame(height: 250)
                
                // Content Section with Custom Header
                Section(header: CustomHeader2(scrollData: scrollData)) {
                    // Simple content items
                    ForEach(0..<20) { index in
                        VStack(alignment: .leading) {
                            Text("Item \(index)")
                                .font(.title3)
                                .padding()
                            Text("Description for item \(index)")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                                .padding(.horizontal)
                            Divider()
                        }
                        .padding(.vertical, 5)
                    }
                }
            }
        }
        .navigationBarHidden(true)
        .overlay(
            (scheme == .dark ? Color.black : Color.white)
                .frame(height: UIApplication.shared.windows.first?.safeAreaInsets.top)
                .ignoresSafeArea(.all, edges: .top)
                .opacity(scrollData.scrollOffset > 250 ? 1 : 0)
            , alignment: .top
        )
    }
}

struct CustomHeader2: View {
    @ObservedObject var scrollData: ScrollViewModel
    @Environment(\.colorScheme) var scheme
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(alignment: .center) {
                // Main title that appears on scroll
                Text("Header Title")
                    .font(.title2)
                    .fontWeight(.bold)
                    .opacity(scrollData.scrollOffset > 200 ? 1 : 0)
                
                Spacer()
            }
            .padding(.horizontal)
            .frame(height: 60)
            
            // Subtitle content that fades in/out
            VStack(alignment: .leading) {
                Text("Subtitle Information")
                    .font(.subheadline)
                HStack {
                    Image(systemName: "star.fill")
                    Text("4.5")
                    Text("•")
                    Text("Details")
                }
                .font(.caption)
            }
            .padding(.horizontal)
            .frame(height: 40)
            .opacity(scrollData.scrollOffset > 200 ? 0 : 1)
            
            if scrollData.scrollOffset > 250 {
                Divider()
            }
        }
        .frame(height: 100)
        .background(scheme == .dark ? Color.black : Color.white)
    }
}



#Preview {
    SimpleParallaxDemo()
}
