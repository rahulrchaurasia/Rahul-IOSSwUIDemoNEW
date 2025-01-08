//
//  Styles.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 13/12/24.
//

import SwiftUICore

/*
 VStack {
     Text("Example")
         .font(Styles.titleFont())
         .modifier(Styles.defaultShadow())
 }
 .background(Styles.cellBackground())

 ///////////////////
 
 or
 VStack {
     Text("Example")
 }
 .background(Styles.Cell.background())
 */


struct Styles {
//    // Background for cells
//    static func cellBackground() -> some View {
//        RoundedRectangle(cornerRadius: 12)
//            .fill()
//            .foregroundColor(.white)
//            .shadow(color: .black.opacity(0.6), radius: 4, x: -2, y: 4)
//    }
//
//    // Background for cards
//    static func cardBackground() -> some View {
//        RoundedRectangle(cornerRadius: 8)
//            .fill()
//            .foregroundColor(.gray.opacity(0.1))
//            .shadow(color: .gray.opacity(0.3), radius: 2, x: 0, y: 2)
//    }

    // Text style
    static func titleFont() -> Font {
        .system(size: 18, weight: .bold)
    }

    // Shadow style
    static func defaultShadow() -> some ViewModifier {
        ShadowModifier()
    }
    
    
    
    struct Cell {
            static func background() -> some View {
                RoundedRectangle(cornerRadius: 12)
                    .fill()
                    .foregroundColor(.white)
                    .shadow(color: .black.opacity(0.6), radius: 4, x: -2, y: 4)
            }
        }

    struct Card {
        static func background() -> some View {
            RoundedRectangle(cornerRadius: 8)
                .fill()
                .foregroundColor(.gray.opacity(0.1))
                .shadow(color: .gray.opacity(0.3), radius: 2, x: 0, y: 2)
        }
    }
}

struct ShadowModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: .black.opacity(0.2), radius: 4, x: 0, y: 2)
    }
}
