//
//  CollapsingHeaderView.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 27/04/25.
//

import SwiftUI



//class ScrollViewModel: ObservableObject {
//    @Published var scrollOffset: CGFloat = 0
//}


// Main component
struct CollapsingHeaderView: View {
    // Customizable properties
    var title: String
    var subtitle: String
    var rating: String?
    var details: String?
    var image: String
    var expandedHeight: CGFloat = 250
    
    // State management
    @StateObject private var scrollData = ScrollViewModel()
    @Environment(\.colorScheme) var scheme
    @Environment(\.presentationMode) var presentationMode
    
    // Background color based on color scheme
    private var backgroundColor: Color {
        scheme == .dark ? Color.black : Color.white
    }
    
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
                        Image(image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: UIScreen.main.bounds.width,
                                  height: expandedHeight + (offset > 0 ? offset : 0))
                            .offset(y: (offset > 0 ? -offset : 0))
                            .overlay(
                                // Gradient overlay for better text visibility
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        Color.black.opacity(0.6),
                                        Color.black.opacity(0.3),
                                        Color.clear
                                    ]),
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                            .overlay(
                                // Back button
                                HStack {
                                    Button(action: {
                                        presentationMode.wrappedValue.dismiss()
                                    }, label: {
                                        Image(systemName: "chevron.left")
                                            .font(.system(size: 18, weight: .semibold))
                                            .foregroundColor(.white)
                                            .padding(12)
                                            .background(Color.black.opacity(0.3))
                                            .clipShape(Circle())
                                    })
                                    Spacer()
                                }
                                .padding()
                                .padding(.top, safeAreaTop)
                                .opacity(scrollData.scrollOffset > 200 ? 0 : 1)
                                .animation(.easeInOut(duration: 0.2), value: scrollData.scrollOffset > 200)
                                , alignment: .top
                            )
                    )
                }
                .frame(height: expandedHeight)
                
                // Content Section with Collapsing Header
                Section(header: CollapsibleSectionHeader(
                    title: title,
                    subtitle: subtitle,
                    rating: rating,
                    details: details,
                    scrollData: scrollData,
                    backgroundColor: backgroundColor
                )) {
                    // List items with improved styling
                    ForEach(0..<20) { index in
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Item \(index)")
                                .font(.headline)
                                .padding(.top, 12)
                                .padding(.horizontal)
                            
                            Text("Description for item \(index). This is a detailed description that shows information about this particular item.")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                                .padding(.horizontal)
                                .padding(.bottom, 12)
                            
                            Divider()
                                .padding(.leading)
                        }
                        .background(backgroundColor)
                    }
                    .padding(.bottom, safeAreaBottom)
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarHidden(true)
        .overlay(
            // Status bar background that appears when scrolled
            backgroundColor
                .frame(height: safeAreaTop)
                .ignoresSafeArea(.all, edges: .top)
                .opacity(scrollData.scrollOffset > 230 ? 1 : 0)
                .animation(.easeInOut(duration: 0.2), value: scrollData.scrollOffset > 230)
            , alignment: .top
        )
        .overlay(
            // Back button that shows when scrolled
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(scheme == .dark ? .white : .black)
                })
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top, safeAreaTop)
            .opacity(scrollData.scrollOffset > 200 ? 1 : 0)
            .animation(.easeInOut(duration: 0.2), value: scrollData.scrollOffset > 200)
            , alignment: .topLeading
        )
    }
    
    // Get safe area values
    private var safeAreaTop: CGFloat {
        UIApplication.shared.windows.first?.safeAreaInsets.top ?? 44
    }
    
    private var safeAreaBottom: CGFloat {
        UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0
    }
}

// Enhanced collapsing header component
struct CollapsibleSectionHeader: View {
    let title: String
    let subtitle: String
    let rating: String?
    let details: String?
    @ObservedObject var scrollData: ScrollViewModel
    let backgroundColor: Color
    
    // Animation thresholds
    private let titleFadeThreshold: CGFloat = 180
    private let subtitleFadeThreshold: CGFloat = 200
    private let dividerThreshold: CGFloat = 230
    
    var body: some View {
        VStack(spacing: 0) {
            // Top section with main title that appears when scrolled
            HStack(alignment: .center) {
                Text(title)
                    .font(.title3)
                    .fontWeight(.bold)
                    .opacity(scrollData.scrollOffset > titleFadeThreshold ? 1 : 0)
                    .animation(.easeInOut(duration: 0.2), value: scrollData.scrollOffset > titleFadeThreshold)
                
                Spacer()
            }
            .padding(.horizontal)
            .frame(height: 60)
            .background(backgroundColor)
            
            // Subtitle section that fades out when scrolled
            VStack(alignment: .leading, spacing: 4) {
                Text(subtitle)
                    .font(.subheadline)
                    .fontWeight(.medium)
                
                if let rating = rating, let details = details {
                    HStack(spacing: 4) {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Text(rating)
                        Text("•")
                            .foregroundColor(.gray)
                        Text(details)
                    }
                    .font(.caption)
                    .foregroundColor(.secondary)
                }
            }
            .padding(.horizontal)
            .frame(minHeight: 40, alignment: .leading)
            .opacity(scrollData.scrollOffset > subtitleFadeThreshold ? 0 : 1)
            .animation(.easeInOut(duration: 0.2), value: scrollData.scrollOffset > subtitleFadeThreshold)
            
            // Divider that appears when scrolled
            if scrollData.scrollOffset > dividerThreshold {
                Divider()
                    .animation(.easeInOut(duration: 0.2), value: scrollData.scrollOffset > dividerThreshold)
            }
        }
        .frame(height: 100)
        .background(backgroundColor)
        // Add subtle shadow when header is collapsed
        .shadow(
            color: Color.black.opacity(scrollData.scrollOffset > dividerThreshold ? 0.1 : 0),
            radius: 4,
            x: 0,
            y: 2
        )
        .animation(.easeInOut(duration: 0.2), value: scrollData.scrollOffset > dividerThreshold)
    }
}

// Example usage
struct CollapsingHeaderView_Demo: View {
    var body: some View {
        NavigationView {
            CollapsingHeaderView(
                title: "Premium Coffee",
                subtitle: "Italian Espresso",
                rating: "4.9",
                details: "Premium Selection",
                image: "food", // Replace with your image name
                expandedHeight: 260
            )
        }
    }
}

#Preview {
    CollapsingHeaderView_Demo()
}
