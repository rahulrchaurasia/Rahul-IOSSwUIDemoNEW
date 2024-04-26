//
//  ProductCardEntity.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 06/04/24.
//

import Foundation


struct ProductCardEntity : Identifiable{
    
    
    let id : String
    let title : String
    let imgName : String
    let isActive : Bool
    
    
    init(id: String = UUID().uuidString, title: String,imgName: String, isActive: Bool) {
        self.id = id
        self.title = title
        self.imgName = imgName
        self.isActive = isActive
    }
    
    func updateProductCard() ->ProductCardEntity {
        
        return ProductCardEntity(id : id,title: title,imgName: imgName, isActive: !isActive)
    }
}
