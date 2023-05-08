//
//  Food.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 01/04/23.
//

import Foundation


struct Food : Identifiable {
    
    var id = UUID().uuidString
    var title : String
    var description : String
    var price : String
    var image : String
    
    init(id: String = UUID().uuidString, title: String, description: String, price: String, image: String) {
        self.id = id
        self.title = title
        self.description = description
        self.price = price
        self.image = image
    }
}

//Food List
var foods = [

    Food(title: "Choclate", description: "Choclate description dcnkwjnckwndck nwkdcnw cw", price: "300Rs", image: "cherry"),
    
    Food(title: "Cookies", description: "Cookies description dcnkwjnckwndck nwkdcnw cw", price: "200Rs", image: "graps"),
    
    Food(title: "Sandwitch", description: "Sandwitch description veg intent and slices of cheeze nwkdcnw cw", price: "120Rs", image: "greenapple"),
    
    Food(title: "Pizza", description: "Pizza description gwgd bwjdjw bjdw nwkdcnw cw", price: "560Rs", image: "orange"),
    
    Food(title: "IceCream", description: "Choclate description dcnkwjnckwndck nwkdcnw cw", price: "270Rs", image: "cherry"),
    
    Food(title: "Bugers", description: "Cookies description dcnkwjnckwndck nwkdcnw cw", price: "180Rs", image: "graps"),
    
    Food(title: "Sweet", description: "Sandwitch description veg intent and slices of cheeze nwkdcnw cw", price: "1020Rs", image: "greenapple"),
    
    Food(title: "Cale", description: "Pizza description gwgd bwjdjw bjdw nwkdcnw cw", price: "820Rs", image: "orange")

]
