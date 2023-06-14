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
}
