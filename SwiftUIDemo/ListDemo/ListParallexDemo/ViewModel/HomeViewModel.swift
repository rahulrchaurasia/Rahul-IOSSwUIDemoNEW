//
//  HomeViewModel.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 30/12/23.
//

import Foundation


class HomeViewModel: ObservableObject {
    
    @Published var offset: CGFloat = 0

    @Published var selectedTab = tabsItems.first!.tab
}
