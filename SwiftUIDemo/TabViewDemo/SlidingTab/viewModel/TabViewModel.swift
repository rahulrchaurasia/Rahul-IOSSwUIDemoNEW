//
//  TabViewModel.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 02/01/24.
//

import Foundation

class TabViewModel : ObservableObject {
    
     // @Published var segmentTitles = ["OPEN", "COMPLETED", "CANCELLED", "ALL"]
    
    var segmentTitles : [String] {
        
        return Segment.allCases.map { $0.rawValue}
    }
   // var selectedSegment: String = Segment.open.rawValue // Track selected segment
   // @Published var selectedSegment: Segment = .open
}


