//
//  CollapseAnimatedStickyHeader.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 24/07/25.
//

import SwiftUI

struct CollapseAnimatedStickyHeader: View {
    var body: some View {
       
        let maxHeight = UIScreen.main.bounds.height / 2.3
        
        ScrollView(.vertical,showsIndicators: false) {
            
            //Top Nav View
            GeometryReader{ proxy in
                
                VStack(alignment: .leading, spacing: 15) {
                    
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .bottom)
                .background(Color.skyblue)
                
                
                
                
            }
            .frame(height: maxHeight)
        }
    }
}

#Preview {
    CollapseAnimatedStickyHeader()
}
