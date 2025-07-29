//
//  CollapseAnimatedStickyHeader.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 24/07/25.
//

/*
 Note :
 1>we used GeometryReader to get top safe height
 proxy.safeAreaInsets.top
 
 2>
 GeometryReader { proxy in
     let topEdge = proxy.safeAreaInsets.top

     HomeCollapseHeaderView(topEdge: topEdge)
         .ignoresSafeArea(.all, edges: .top)
 }

 Dynamic and Device-Aware
 * proxy.safeAreaInsets.top gives real-time safe area inset.
 * Automatically adapts to:
     * iPhone with/without notch
     * iPads
     * Landscape mode
     * Dynamic island
     * Future device changes
 2. Avoids Hardcoding
 * You’re not hardcoding 44 or 20 for status bar height — avoids breakage across devices.
 3. Clean Separation
 * You calculate the topEdge once and pass it down to your view hierarchy (HomeCollapseHeaderView).
 * Inside that view, you control padding with .padding(.top, topEdge) — perfect for header overlays or nav buttons.

 
 */
import SwiftUI

struct CollapseAnimatedStickyHeader: View {
    var body: some View {
       
       //To ignore and get Safe Area Sizes
        
        GeometryReader { proxy in
            
            //VVIMp for dynamic top area get from GeometryReader
            let topEdge = proxy.safeAreaInsets.top
            
            
 //proxy.safeAreaInsets.top → gives you the top safe area (e.g., notch, status bar).
            

            
             HomeCollapseHeaderView(topEdge : topEdge,
                                    fullViewHeight: proxy.size.height )// Pass the height down
                .ignoresSafeArea(.all, edges: .top)
        }
        .navigationBarHidden(true)
        //.toolbar(.hidden, for: .navigationBar)
        
    }
        
}

#Preview {
    CollapseAnimatedStickyHeader()
}
