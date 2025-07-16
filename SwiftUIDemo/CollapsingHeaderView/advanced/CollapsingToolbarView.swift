//
//  CollapsingToolbarView.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 16/07/25.
//

import SwiftUI

struct CollapsingToolbarView: View {
    // MARK: - Properties
    
    // Constants for header sizes
    private let maxHeaderHeight: CGFloat = 280
    private let minHeaderHeight: CGFloat = 110 // Safe area top + standard nav bar height
    
    // MARK: - Body
    
    var body: some View {
       // NavigationStack {
            ScrollView(showsIndicators: false) {
                // Use a VStack with spacing: 0 to stack the header and content seamlessly
                VStack(spacing: 0) {
                    
                    // The view that represents the header area.
                    // It uses a GeometryReader to calculate its position and size.
                    HeaderView()
                    
                    // Your main scrollable content
                    ContentListView()
                }
            }
            .background(Color(.systemGroupedBackground)) // Set a background for the entire view
            .ignoresSafeArea(edges: .top) // The scroll view should go under the status bar
       // }
    }
    
    // MARK: - Header View
    @ViewBuilder
    private func HeaderView() -> some View {
        // GeometryReader provides the coordinate space and frame data
        GeometryReader { geo in
            let minY = geo.frame(in: .global).minY
            
            // --- Calculations for Animations ---
            
            // 1. Calculate the current height of the header
            let headerHeight = max(minHeaderHeight, maxHeaderHeight + minY)
            
            // 2. Calculate the opacity for the large title
            // Fades out as the user scrolls up
            let titleOpacity = min(1, max(0, (headerHeight - minHeaderHeight - 20) / 40))
            
            // 3. Calculate the scale for the large title
            // Shrinks as the user scrolls up
            let titleScale = 1 + (minY / 1000)
            
            ZStack(alignment: .bottom) {
                // Background Image
                Image("denver")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: headerHeight)
                    .clipped() // Prevents image from overflowing its frame

                // Large Title Overlay
                Text("Summer Landscape")
                    .font(.system(size: 36, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.bottom, 20)
                    .scaleEffect(max(0.9, titleScale)) // Apply scale, with a minimum
                    .opacity(titleOpacity) // Apply opacity
            }
            // This offset keeps the header "stuck" to the top during scroll
            .offset(y: -minY)
        }
        .frame(height: maxHeaderHeight) // This sets the initial space for the header
    }
    
    // MARK: - Content List View
    @ViewBuilder
    private func ContentListView() -> some View {
        VStack {
            ForEach(1...15, id: \.self) { index in
                HStack {
                    VStack(alignment: .leading) {
                        Text("Item #\(index)")
                            .font(.headline)
                        Text("Some descriptive subtitle text")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(.secondary)
                }
                .padding()
                .background(Color(.secondarySystemGroupedBackground))
                .cornerRadius(10)
                .padding(.horizontal)
                .padding(.vertical, 4)
            }
        }
        .padding(.top, 10)
        // This is the key for the small title to appear
        .navigationTitle("Photos")
        .navigationBarTitleDisplayMode(.inline)
    }
}


#Preview {
    CollapsingToolbarView()
}
