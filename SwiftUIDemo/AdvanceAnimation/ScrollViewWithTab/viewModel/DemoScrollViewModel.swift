//
//  DemoScrollViewModel.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 22/08/25.
//

import Foundation



@MainActor
final class DemoScrollViewModel: ObservableObject {
    @Published var selectedTab: DemoTab = .one
    @Published var tabOffsets: [DemoTab: CGFloat] = [:]
    @Published var isDragging = false
    @Published var isProgrammaticScroll = false
    
    /// Update the selected tab based on which section is closest to the top
    func updateSelectedTab() {
        guard !tabOffsets.isEmpty else { return }
        
        let targetY: CGFloat = 50 // offset below nav
        if let best = tabOffsets.min(by: { abs($0.value - targetY) < abs($1.value - targetY) })?.key {
            if best != selectedTab {
                selectedTab = best
            }
        }
    }
}


enum DemoTab: String, CaseIterable, Identifiable {
    case one = "One"
    case two = "Two"
    case three = "Three"
    case four = "Four"
    case five = "Five"
    case six = "Six"
    
    var id: String { rawValue }
}
