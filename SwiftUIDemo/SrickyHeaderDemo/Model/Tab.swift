//
//  Tab.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 03/04/23.
//

import Foundation


struct Tab : Identifiable {
    
    var id = UUID().uuidString
    var tabTitle :String
    var foods : [Food]
}

var tabItems = [
    
    Tab(tabTitle: "Ordered Again", foods: foods.shuffled()),
    // foods is a list of data declare in Food Struct
    Tab(tabTitle: "Picked For You", foods: foods.shuffled()),
    Tab(tabTitle: "Starters", foods: foods.shuffled()),
    Tab(tabTitle: "Reebok Brands", foods: foods.shuffled())
]
