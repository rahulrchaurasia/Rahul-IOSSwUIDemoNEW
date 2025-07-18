//
//  AdvancedCollapsingToolbarView.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 16/07/25.
//
//
//  AdvancedCollapsingToolbarView.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 16/07/25.
//
/*
 Why This Works in CollapsingHeaderView2:
 maxHeight + minY allows the header to stretch when you pull down.

 max(..., minHeight) prevents collapsing below the minimum height.

 .offset(y: -minY) ensures it stays pinned to the top of the screen during scroll.

///////////////////////////////////////
 
 .offset(y: -minY) — What It Does
 minY is how far the top of the view is from the top of the screen.

 As you scroll up, minY becomes negative.

 .offset(y: -minY) cancels out that movement — effectively fixing (pinning) the view to the top.


 */
import SwiftUI

struct AdvancedCollapsingToolbarView: View {
    private let maxHeaderHeight: CGFloat = 280
    private let minHeaderHeight: CGFloat = 100

    @State private var headerOffset: CGFloat = 0

    private var collapseProgress: CGFloat {
        let range = maxHeaderHeight - minHeaderHeight
        return min(1, max(0, headerOffset / range))
    }

    var body: some View {
        ZStack(alignment: .top) {
            ScrollView(showsIndicators: false) {
                LazyVStack(spacing: 0, pinnedViews: [.sectionHeaders]) {
                    GeometryReader { geo in
                        Color.clear
                            .preference(
                                key: ScrollOffsetPreferenceKey.self,
                                value: -geo.frame(in: .named("scroll")).origin.y
                            )
                    }
                    .frame(height: 0)

                    // ✅ Collapsing Header INSIDE scroll
                    CollapsingHeaderView2(offset: headerOffset,
                                         maxHeight: maxHeaderHeight,
                                         minHeight: minHeaderHeight)

                    // ✅ Pinned Section
                    Section(header:
                        PinnedHeaderView(
                            title: "Premium Coffee",
                            subtitle: "Italian Espresso",
                            rating: "4.9",
                            details: "Premium Selection",
                            scrollOffset: headerOffset
                        )
                    ) {
                        ContentListView()
                    }
                }
            }
            .coordinateSpace(name: "scroll")
            .onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
                headerOffset = value
            }

            // ✅ Custom toolbar fades in as we scroll
            CustomToolbarView(progress: collapseProgress)
        }
        .ignoresSafeArea(edges: .top)
        .navigationBarHidden(true)
    }
}




struct CollapsingHeaderView2: View {
    let offset: CGFloat // You can remove this if switching to minY-based layout
    let maxHeight: CGFloat
    let minHeight: CGFloat

    var body: some View {
        GeometryReader { geo in
            let minY = geo.frame(in: .global).minY

//            let maxStretch = maxHeight * 0.2 // Stretch only 20% beyond max height
//            let extraStretch = min(maxStretch, max(0, minY))
//            let headerHeight = max(minHeight, maxHeight + extraStretch)
            
            let headerHeight = max(minHeight, maxHeight + minY)
           
            let titleOpacity = min(1, max(0, (headerHeight - minHeight - 20) / 40))
            let titleScale = 1 + (minY / 1000)

            ZStack(alignment: .bottom) {
                // ✅ Background with gradient and some design
                LinearGradient(
                    gradient: Gradient(colors: [.blue, .purple, .pink]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .overlay(
                    ZStack {
                        Circle()
                            .fill(Color.white.opacity(0.1))
                            .frame(width: 200, height: 200)
                            .offset(x: -50, y: -30)

                        Circle()
                            .fill(Color.white.opacity(0.05))
                            .frame(width: 150, height: 150)
                            .offset(x: 100, y: 50)
                    }
                )
                .frame(height: headerHeight)
                .clipped()

                // ✅ Header Title
                VStack(spacing: 8) {
                    Text("Summer Landscape")
                        .font(.system(size: 36, weight: .bold))
                        .foregroundColor(.white)
                        .scaleEffect(max(0.9, titleScale))

                    Text("Beautiful mountain scenery")
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.9))
                        .opacity(titleOpacity)
                }
                .padding(.bottom, 20)
            }
            .frame(height: headerHeight)
            .offset(y: -minY)
        }
        .frame(height: maxHeight) // Reserve space initially
    }
}



//struct CollapsingHeaderView2: View {
//    let offset: CGFloat
//    let maxHeight: CGFloat
//    let minHeight: CGFloat
//
//    var body: some View {
//        GeometryReader { geo in
//            let minY = geo.frame(in: .global).minY
//
//            // ✅ Limit stretch to 20% beyond max height
//            let stretchLimit = maxHeight * 0.2
//            let headerHeight = min(maxHeight + stretchLimit, max(minHeight, maxHeight + minY))
//
//            // ✅ Fade and scale for title
//            let titleOpacity = min(1, max(0, (headerHeight - minHeight - 20) / 40))
//            let titleScale = 1 + (minY / 1000)
//
//            ZStack(alignment: .bottom) {
//                // ✅ Gradient Background
//                LinearGradient(
//                    gradient: Gradient(colors: [.blue, .purple, .pink]),
//                    startPoint: .topLeading,
//                    endPoint: .bottomTrailing
//                )
//                .overlay(
//                    ZStack {
//                        Circle()
//                            .fill(Color.white.opacity(0.1))
//                            .frame(width: 200, height: 200)
//                            .offset(x: -50, y: -30)
//
//                        Circle()
//                            .fill(Color.white.opacity(0.05))
//                            .frame(width: 150, height: 150)
//                            .offset(x: 100, y: 50)
//                    }
//                )
//                .frame(height: headerHeight)
//                .clipped()
//
//                // ✅ Collapsing Title
//                VStack(spacing: 8) {
//                    Text("Summer Landscape")
//                        .font(.system(size: 36, weight: .bold))
//                        .foregroundColor(.white)
//                        .scaleEffect(max(0.9, titleScale))
//
//                    Text("Beautiful mountain scenery")
//                        .font(.subheadline)
//                        .foregroundColor(.white.opacity(0.9))
//                        .opacity(titleOpacity)
//                }
//                .padding(.bottom, 20)
//            }
//            .frame(height: headerHeight)
//            .offset(y: -minY) // ✅ Keeps header pinned at top
//        }
//        .frame(height: maxHeight) // Initial space reservation
//    }
//}



// MARK: - Pinned Header
struct PinnedHeaderView: View {
    let title: String
    let subtitle: String
    let rating: String?
    let details: String?
    let scrollOffset: CGFloat
    
    private let titleFadeThreshold: CGFloat = 180
    private let subtitleFadeThreshold: CGFloat = 200
    
    var body: some View {
        VStack(spacing: 0) {
            // Title that fades in when scrolled
            HStack {
                Text(title)
                    .font(.title3)
                    .fontWeight(.bold)
                    .opacity(scrollOffset > titleFadeThreshold ? 1 : 0)
                
                Spacer()
            }
            .padding(.horizontal, 16)
            .frame(height: 50)
            .background(Color(.systemBackground))
            .animation(.easeInOut(duration: 0.2), value: scrollOffset > titleFadeThreshold)
            
            // Subtitle and rating
            VStack(alignment: .leading, spacing: 4) {
                Text(subtitle)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                if let rating = rating, let details = details {
                    HStack(spacing: 4) {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                            .font(.caption)
                        Text(rating)
                            .font(.caption)
                            .fontWeight(.medium)
                        Text("•")
                            .foregroundColor(.gray)
                            .font(.caption)
                        Text(details)
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .background(Color(.systemBackground))
            .opacity(scrollOffset > subtitleFadeThreshold ? 0 : 1)
            .animation(.easeInOut(duration: 0.2), value: scrollOffset > subtitleFadeThreshold)
        }
        .background(Color(.systemBackground))
        .shadow(
            color: .black.opacity(scrollOffset > 220 ? 0.1 : 0),
            radius: 4,
            x: 0,
            y: 2
        )
    }
}

// MARK: - Custom Toolbar
struct CustomToolbarView: View {
    let progress: CGFloat

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Button(action: {}) {
                    Image(systemName: "chevron.left")
                }
                Spacer()
                Text("Photos")
                    .scaleEffect(0.8 + progress * 0.2)
                    .opacity(progress)
                Spacer()
                Button(action: {}) {
                    Image(systemName: "ellipsis")
                }
            }
            .padding(.horizontal)
            .padding(.top, getSafeAreaTop() + 8)
            .frame(height: 44 + getSafeAreaTop())
            .background(.ultraThinMaterial)
            .opacity(progress)
        }
        .ignoresSafeArea(edges: .top)
    }

    private func getSafeAreaTop() -> CGFloat {
        UIApplication.shared.connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap { $0.windows }
            .first?
            .safeAreaInsets.top ?? 44
    }
}


// MARK: - Content List
struct ContentListView: View {
    var body: some View {
        LazyVStack(spacing: 12) {
            ForEach(1...30, id: \.self) { index in
                HStack(spacing: 12) {
                    // Left icon
                    Circle()
                        .fill(LinearGradient(
                            gradient: Gradient(colors: [.blue, .purple]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ))
                        .frame(width: 40, height: 40)
                        .overlay(
                            Text("\(index)")
                                .font(.system(size: 14, weight: .bold))
                                .foregroundColor(.white)
                        )
                    
                    // Content
                    VStack(alignment: .leading, spacing: 4) {
                        Text("List Item #\(index)")
                            .font(.system(size: 17, weight: .medium))
                            .foregroundColor(.primary)
                        
                        Text("Sample description for item number \(index)")
                            .font(.system(size: 15))
                            .foregroundColor(.secondary)
                            .lineLimit(2)
                    }
                    
                    Spacer()
                    
                    // Right chevron
                    Image(systemName: "chevron.right")
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(.secondary)
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 12)
                .background(Color(.secondarySystemGroupedBackground))
                .cornerRadius(12)
                .shadow(color: .black.opacity(0.05), radius: 2, x: 0, y: 1)
            }
        }
        .padding(.horizontal, 16)
        .padding(.bottom, 100)
    }
}

#Preview {
    AdvancedCollapsingToolbarView()
}
