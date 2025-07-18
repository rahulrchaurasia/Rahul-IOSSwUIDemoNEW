//
//  ScrollOffsetPreferenceKey.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 16/07/25.
//

import SwiftUICore


struct ScrollOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
