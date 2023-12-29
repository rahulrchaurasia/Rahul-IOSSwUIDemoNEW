//
//  SweetProductTab.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 28/12/23.
//

import Foundation



struct SweetProductTab : Identifiable {
    
    
   var id =  UUID().uuidString
    
    var tab : ProductTab
    
    var sweetProductList : [SweetProduct]
    
    
}


enum ProductTab: String, CaseIterable {
    case orderAgain = "Order Again"
    case pickedForYou = "Picked For You"
    case starter = "Starter"
    case mainCourse = "Main Course"
}



