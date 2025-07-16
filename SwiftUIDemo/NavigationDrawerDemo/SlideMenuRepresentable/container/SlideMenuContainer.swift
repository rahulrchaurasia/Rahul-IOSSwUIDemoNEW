//
//  SlideMenuContainer.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 24/03/25.
//

import SwiftUI

struct SlideMenuContainer<Content: View, MenuContent: View>: View {
    @State private var isMenuOpen = false
    
    let content: Content
    let menuContent: MenuContent
    
    init(@ViewBuilder content: () -> Content, @ViewBuilder menuContent: () -> MenuContent) {
        self.content = content()
        self.menuContent = menuContent()
    }
    
    var body: some View {
        SlideMenuViewControllerRepresentable(
            isMenuOpen: $isMenuOpen,
            content: { content },
            menuContent: { menuContent }
        )
        .edgesIgnoringSafeArea(.all)
    }
}
