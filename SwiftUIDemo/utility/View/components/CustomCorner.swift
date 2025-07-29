//
//  CustomCorner.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 25/07/25.
//

import SwiftUI

struct CustomCorner: Shape {
    
    var corners : UIRectCorner
    var radius : CGFloat
    
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

//#Preview {
//    CustomCorner()
//}
