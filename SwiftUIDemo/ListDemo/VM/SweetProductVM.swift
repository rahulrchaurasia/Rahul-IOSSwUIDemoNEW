//
//  SweetProductVM.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 28/12/23.
//

import Foundation


@MainActor class SweetProductVM : ObservableObject {
    
    
    
    @Published var sweetProductList : [SweetProduct] = []
    
    @Published var offset: CGFloat = 0

   // @Published var selectedTab = SweetProductTabItems.first!.tab.rawValue
    
    func getSweetProduct(){
        
        sweetProductList.removeAll()

        sweetProductList.append (SweetProduct(title: "Chocklate Cake ", description: "Dark Chocklate with truffle", price: "300Rs", image: "cherry"))
            
        sweetProductList.append (SweetProduct(title: "Cookies", description: "Cookies description dcnkwjnckwndck nwkdcnw cw", price: "200Rs", image: "graps"))
            
        sweetProductList.append (SweetProduct(title: "Sandwitch", description: "Sandwitch description veg intent and slices of cheeze nwkdcnw cw", price: "120Rs", image: "greenapple"))
            
        sweetProductList.append (SweetProduct(title: "Pizza", description: "Pizza description gwgd bwjdjw bjdw nwkdcnw cw", price: "560Rs", image: "orange"))
            
        sweetProductList.append (SweetProduct(title: "IceCream", description: "Choclate description dcnkwjnckwndck nwkdcnw cw", price: "270", image: "cherry"))
            
        sweetProductList.append (SweetProduct(title: "Bugers", description: "Cookies description dcnkwjnckwndck nwkdcnw cw", price: "180", image: "graps"))
            
        sweetProductList.append (SweetProduct(title: "Sweet", description: "Sandwitch description veg intent and slices of cheeze nwkdcnw cw", price: "1020", image: "greenapple"))
            
        sweetProductList.append (SweetProduct(title: "Cale", description: "Pizza description gwgd bwjdjw bjdw nwkdcnw cw", price: "820Rs", image: "orange"))


        sweetProductList.append (SweetProduct(title: "butter Chicken", description: "Chicken description dcnkwjnckwndck nwkdcnw cw", price: "870", image: "rice"))
            
        sweetProductList.append (SweetProduct(title: "Chinese", description: "Chinese description dcnkwjnckwndck nwkdcnw cw", price: "810", image: "egg_chicken_red"))
            
        sweetProductList.append (SweetProduct(title: "Salad-fruits", description: "Sandwitch description veg intent and slices of cheeze nwkdcnw cw", price: "100", image: "beverages"))
            
        sweetProductList.append (SweetProduct(title: "Tandoor", description: "Pizza description gwgd bwjdjw bjdw nwkdcnw cw", price: "2400", image: "bakery_snacks"))


       
    }
    
    
    var SweetProductTabItems: [SweetProductTab] {
            get {
                // Ensure shuffling happens each time the property is accessed
                return [
                    SweetProductTab(tab: .orderAgain, sweetProductList: sweetProductList.shuffled()),
                    SweetProductTab(tab: .pickedForYou, sweetProductList: sweetProductList.shuffled()),
                    SweetProductTab(tab: .starter, sweetProductList: sweetProductList.shuffled()),
                    SweetProductTab(tab: .mainCourse, sweetProductList: sweetProductList.shuffled())
                ]
            }
        }
    
}
