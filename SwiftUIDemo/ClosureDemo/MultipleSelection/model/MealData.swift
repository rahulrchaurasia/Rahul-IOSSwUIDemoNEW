//
//  MealData.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 06/10/23.
//

import Foundation

struct MealData : Identifiable,Hashable {
    
    var id : Int
    var name: String
    var description: String
    var price: Double
    var imageUrl : String
    var isSelected: Bool = false
}
