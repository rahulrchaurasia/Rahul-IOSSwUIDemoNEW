//
//  SweetProduct.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 25/12/23.
//

import Foundation

struct SweetProduct : Identifiable{
    
    var id = UUID().uuidString
    var title : String
    var description : String
    var price : String
    var image : String
    var isSelected : Bool
    
    
    init(id: String = UUID().uuidString, title: String, description: String, price: String, image: String, isSelected  : Bool = false) {
        self.id = id
        self.title = title
        self.description = description
        self.price = price
        self.image = image
        self.isSelected = isSelected
        
    }
    
}

//SweetProduct List


var sweetProductList = [

    SweetProduct(title: "Chocklate Cake ", description: "Dark Chocklate with truffle", price: "300Rs", image: "cherry"),
    
    SweetProduct(title: "Cookies", description: "Cookies description dcnkwjnckwndck nwkdcnw cw", price: "200Rs", image: "graps"),
    
    SweetProduct(title: "Sandwitch", description: "Sandwitch description veg intent and slices of cheeze nwkdcnw cw", price: "120Rs", image: "greenapple"),
    
    SweetProduct(title: "Pizza", description: "Pizza description gwgd bwjdjw bjdw nwkdcnw cw", price: "560Rs", image: "orange"),
    
    SweetProduct(title: "IceCream", description: "Choclate description dcnkwjnckwndck nwkdcnw cw", price: "270", image: "cherry"),
    
    SweetProduct(title: "Bugers", description: "Cookies description dcnkwjnckwndck nwkdcnw cw", price: "180", image: "graps"),
    
    SweetProduct(title: "Sweet", description: "Sandwitch description veg intent and slices of cheeze nwkdcnw cw", price: "1020", image: "greenapple"),
    
    SweetProduct(title: "Cale", description: "Pizza description gwgd bwjdjw bjdw nwkdcnw cw", price: "820Rs", image: "orange"),


    SweetProduct(title: "butter Chicken", description: "Chicken description dcnkwjnckwndck nwkdcnw cw", price: "870", image: "rice"),
    
    SweetProduct(title: "Chinese", description: "Chinese description dcnkwjnckwndck nwkdcnw cw", price: "810", image: "egg_chicken_red"),
    
    SweetProduct(title: "Salad-fruits", description: "Sandwitch description veg intent and slices of cheeze nwkdcnw cw", price: "100", image: "beverages"),
    
    SweetProduct(title: "Tandoor", description: "Pizza description gwgd bwjdjw bjdw nwkdcnw cw", price: "2400", image: "bakery_snacks")


]
