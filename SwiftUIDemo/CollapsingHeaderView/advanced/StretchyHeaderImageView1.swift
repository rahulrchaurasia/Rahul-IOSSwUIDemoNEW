//
//  StretchyHeaderImageView1.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 18/07/25.
//

import SwiftUI



struct StretchyHeaderImageView1: View {
    private let headerHeight: CGFloat = 250

    var body: some View {
        GeometryReader { proxy in
            let topSafeArea = proxy.safeAreaInsets.top

            ScrollView(showsIndicators: false) {
                ZStack(alignment: .top) {
                    
                    Color(.bg)
                    // MARK: Stretchy Header
                    GeometryReader { geo in
                        let yOffset = geo.frame(in: .global).minY
                        Image("cookie")
                            .resizable()
                            .scaledToFill()
                            .frame(width: geo.size.width, height: max(headerHeight, headerHeight + yOffset))
                            .clipped()
                            .offset(y: yOffset < 0 ? 0 : -yOffset)
                    }
                    .frame(height: headerHeight)
                    .ignoresSafeArea(edges: .top)

                    // MARK: Main Content
                    VStack(spacing: 0) {
                        Spacer().frame(height: headerHeight)

                        LazyVStack(spacing: 0, pinnedViews: [.sectionHeaders]) {
                            Section(
                                header:
                                    StickySampleHeaderView2()
                                        .frame(height: 50)
                                        .background(Color.white) // Optional: match your design
                                        .padding(.top, topSafeArea) // <- ✅ Key fix
                            ) {
                                ForEach(1..<31) { index in
                                    Text("Item \(index)")
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding()
                                        .background(Color(.secondarySystemBackground))
                                        .cornerRadius(8)
                                        .padding(.horizontal)
                                        .padding(.vertical, 4)
                                }
                            }
                        }
                    }
                }
            }
            .ignoresSafeArea(edges: .top)
        }
        .navigationBarHidden(true)
    }
}


struct StickySampleHeaderView2: View {
    var body: some View {
        ZStack {
            Color(.systemBackground)
            Text("Sticky Header")
                .font(.headline)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .background(Color(.systemBackground))
        .zIndex(1) // ensure it's pinned above scroll content
    }
}




#Preview {
    StretchyHeaderImageView1()
}
