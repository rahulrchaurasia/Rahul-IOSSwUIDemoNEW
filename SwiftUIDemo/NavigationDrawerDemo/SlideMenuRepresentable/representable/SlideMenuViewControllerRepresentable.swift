//
//  SlideMenuViewControllerRepresentable.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 24/03/25.
//

import Foundation


import SwiftUI

import SwiftUI

struct SlideMenuViewControllerRepresentable<Content: View, MenuContent: View>: UIViewControllerRepresentable {
    @Binding var isMenuOpen: Bool
    let content: () -> Content
    let menuContent: () -> MenuContent
    
    func makeUIViewController(context: Context) -> SlideMenuViewController {
        let viewController = SlideMenuViewController()
        
        let mainContentHost = UIHostingController(rootView: content())
        let menuContentHost = UIHostingController(rootView: menuContent())
        
        viewController.addChild(mainContentHost)
        viewController.mainContentView.addSubview(mainContentHost.view)
        mainContentHost.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainContentHost.view.topAnchor.constraint(equalTo: viewController.mainContentView.topAnchor),
            mainContentHost.view.leadingAnchor.constraint(equalTo: viewController.mainContentView.leadingAnchor),
            mainContentHost.view.trailingAnchor.constraint(equalTo: viewController.mainContentView.trailingAnchor),
            mainContentHost.view.bottomAnchor.constraint(equalTo: viewController.mainContentView.bottomAnchor)
        ])
        mainContentHost.didMove(toParent: viewController)
        
        viewController.addChild(menuContentHost)
        viewController.menuView.addSubview(menuContentHost.view)
        menuContentHost.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            menuContentHost.view.topAnchor.constraint(equalTo: viewController.menuView.topAnchor),
            menuContentHost.view.leadingAnchor.constraint(equalTo: viewController.menuView.leadingAnchor),
            menuContentHost.view.trailingAnchor.constraint(equalTo: viewController.menuView.trailingAnchor),
            menuContentHost.view.bottomAnchor.constraint(equalTo: viewController.menuView.bottomAnchor)
        ])
        menuContentHost.didMove(toParent: viewController)
        
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: SlideMenuViewController, context: Context) {
        uiViewController.isMenuOpen = isMenuOpen
    }
}

