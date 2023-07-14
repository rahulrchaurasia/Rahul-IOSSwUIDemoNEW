//
//  View+Extension.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 14/06/23.
//

// For For a TextField in SwiftUI, using a ViewModifier is typically more suitable than a ViewBuilder.
import Foundation
import SwiftUI

extension View {
    func circularText() -> some View {
        self.modifier(CircularText())
    }
    
    func underlineTextField() -> some View {
            self
                .padding(.vertical, 10)
                .overlay(Rectangle().frame(height: 2).padding(.top, 35).foregroundColor(Color.gray.opacity(0.5)))
                .foregroundColor(Color.black)
                
                .padding(10)
        }
    
    func customTextViewModifier( roundedCornes: CGFloat,
     textColor: Color) -> some View {
        
        self.modifier(CustomTextViewModifier(roundedCornes: roundedCornes, textColor: textColor))
    }
}
