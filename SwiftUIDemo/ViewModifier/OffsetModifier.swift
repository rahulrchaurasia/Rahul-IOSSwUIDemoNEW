//
//  OffsetModifier.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 28/07/25.
//

import SwiftUI

/*
 
 Old way :——>
 .overlay (
                 
                 GeometryReader { proxy -> Color in
                     
                     let minY = proxy.frame(in: .global).minY
                     print(minY)
                     
                     return Color.clear
                         
                 }
                 ,alignment: .top
                
             )

 ✅ Your example is a function call with a trailing closure and explicit label for another parameter (alignment:):

 .overlay(alignment: .top) {
     GeometryReader { proxy in
         let minY = proxy.frame(in: .global).minY
         print(minY)
         return Color.clear
     }
 }
 
 Purpuse :
 
 What this does:
 It wraps any view (content) and puts an invisible GeometryReader on top.

 It reads the Y position (minY) of the content’s top in global coordinates.

 It prints that offset (you can later bind it to something useful like a collapsing header).

 It returns .clear to make sure it doesn't render anything visible.

 The use of @Binding allows passing the value back to the parent (HomeCollapseHeaderView).

 */



struct OffsetModifier: ViewModifier {
    @Binding var offset: CGFloat

    func body(content: Content) -> some View {
        content
            .overlay(
                GeometryReader { proxy in
                    let minY = proxy.frame(in: .named("SCROLL")).minY
                    Color.clear
                        .preference(key: ScrollOffsetPreferenceKey.self, value: minY)
                }
            )
            .onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
                offset = value
            }
    }
}

struct OffsetModifier1: ViewModifier {
    
    @Binding var offset: CGFloat
    
    func body(content: Content) -> some View {
        content
        //            .overlay {
        //
        //                GeometryReader { proxy -> Color in
        //
        //                    let minY = proxy.frame(in: .global).minY
        //                    print(minY)
        //
        //                    return Color.clear
        //
        //                }
        //                ,alignment: .top
        //
        //            }
        
            .overlay(alignment: .top) {
                GeometryReader { proxy -> Color in
                    
                    //For Global
                   // let minY = proxy.frame(in: .global).minY
                    
                    //getting value from coordinate space called scroll...
                    let minY = proxy.frame(in: .named("SCROLL")).minY
                    print(minY)
                    
                    DispatchQueue.main.async {
                        self.offset = minY
                    }
                    
                    return Color.clear
                    
                }
            }
    }
   
}
