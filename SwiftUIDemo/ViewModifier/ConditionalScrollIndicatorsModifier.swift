//
//  ConditionalScrollIndicatorsModifier.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 29/04/24.
//

import Foundation
import SwiftUI



struct ConditionalScrollIndicatorsModifier: ViewModifier {
    func body(content: Content) -> some View {
        if #available(iOS 16.0, *) {
            return content.scrollIndicators(.hidden)
        } else {
            return content
        }
    }
}
