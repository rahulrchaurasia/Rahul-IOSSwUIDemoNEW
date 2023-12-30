//
//  Tab.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 03/04/23.
//

import Foundation


struct Tab1 : Identifiable {
    
    var id = UUID().uuidString
    var tabTitle :String
    var foods : [Food1]
}

var tabItems = [
    
    Tab1(tabTitle: "Ordered Again", foods: foods1.shuffled()),
    // foods is a list of data declare in Food Struct
    Tab1(tabTitle: "Picked For You", foods: foods1.shuffled()),
    Tab1(tabTitle: "Starters", foods: foods1.shuffled()),
    Tab1(tabTitle: "Reebok Brands", foods: foods1.shuffled())
]
