//
//  CustomTabViewModel.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 02/01/24.
//

import Foundation

class CustomTabViewModel : ObservableObject  {
 
//    var segmentTitles : [Segment] {
//        
//        return Segment.allCases.map { $0}
//    }
   // var selectedSegment: String = Segment.open.rawValue // Track selected segment
    
    var segmentTitles : [Segment] {
        
        Segment.allCases
    }
    @Published var selectedSegment: Segment = .open

}


enum Segment: String, CaseIterable {
    case open = "OPEN"
    case completed = "COMPLETED"
    case cancelled = "CANCELLED"
    case all = "ALL"
 
}
