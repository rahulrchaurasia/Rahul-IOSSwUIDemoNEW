//
//  ProductCardViewModel.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 06/04/24.
//

import Foundation

@MainActor  class ProductCardViewModel : ObservableObject {
    
    
    @Published var productCardLst: [ProductCardEntity] = []
    
    
    func getItems() async throws{
        productCardLst.removeAll()
        try await Task.sleep(nanoseconds: 4 * 1_000_000_000) // 2 seconds in nanoseconds


                let newItems = [
        
                    ProductCardEntity(title: "Luxary swedian Chair", imgName: "cooking_oil", isActive:  false),
                    
                    ProductCardEntity(title: "Classic Table", imgName: "food", isActive:  false),
                    
                    ProductCardEntity(title: "Modern woden furniture", imgName: "sandwich", isActive:  false),
                    
                    ProductCardEntity(title: "Classic Sofa", imgName: "cookie", isActive:  false),
                    
                    ProductCardEntity(title: "Mint ginger Soda", imgName: "ginger", isActive:  false)
                 ]
        
        productCardLst.append(contentsOf: newItems)
        
    }
   
    
}
