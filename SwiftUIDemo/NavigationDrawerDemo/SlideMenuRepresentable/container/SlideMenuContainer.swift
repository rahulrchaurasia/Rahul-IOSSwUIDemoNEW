//
//  SlideMenuContainer.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 24/03/25.
//

import SwiftUI

struct SlideMenuContainer<Content: View, MenuContent: View>: View {
    @State private var isMenuOpen = false
    
    private let content: Content
    private let menuContent: MenuContent
    
    init(@ViewBuilder content: () -> Content, @ViewBuilder menuContent: () -> MenuContent) {
        self.content = content()
        self.menuContent = menuContent()
    }
    
    var body: some View {
        ZStack {
            SlideMenuViewControllerRepresentable(
                isMenuOpen: $isMenuOpen,
                content: { content },
                menuContent: { menuContent }
            )
            .edgesIgnoringSafeArea(.all)
            
            if !isMenuOpen {
                Button(action: { isMenuOpen.toggle() }) {
                    Color.clear
                        .contentShape(Rectangle())
                        .frame(width: 20)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}
