//
//  Item.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 31/12/23.
//

import Foundation

struct Item : Identifiable {
    
    var id = UUID()
        var title : String
    var isExpanded : Bool = false
    var subItem : [subItem]?
    
    
}

struct subItem : Identifiable {
    var id = UUID()
    var subtitle  : String
}


// Sample data
