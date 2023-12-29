//
//  SweetProductItem.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 26/12/23.
//

import SwiftUI

struct SweetProductItem: View {
    
    let product : SweetProduct
    var isSelected : Bool = false
    var didTap: (()->())?
    
    var body: some View {
        
        VStack(spacing: 0){
          
            HStack(alignment: .center, spacing: 15) {
                
                Image(product.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60,height: 60)
                    .padding()
                    .background(
                        Color.gray.opacity(0.4))
                    .cornerRadius(20)
        
                
                
                VStack(alignment: .leading, spacing: 10, content: {
                    Text(product.title)
                        .font(.customfont(.bold, fontSize: 19))
                    Text(product.description)
                        .font(.caption)
                        .lineLimit(3)
                    
                })
                
            
               
            }
            
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
            
            
            .padding()
            
            .background(
            
                Color.bg
            )
            .cornerRadius(15)
            .padding(.horizontal,10)
            
        }
        .overlay(alignment: .bottomTrailing) {
           
            Image(systemName: isSelected ? "heart.fill" : "heart")
                .imageScale(.large)
                .foregroundColor(isSelected ? .red : .black)
                .scaleEffect(isSelected ? 1.2 : 1)
                .animation(.easeInOut, value: isSelected)
                .frame(width: 40, height: 40)
                .background(Color.clear)
                .offset(x: 8, y:16)
                .onTapGesture {
                    
                   didTap?()
                }
        }
          .background(isSelected ? Color(UIColor.systemGray5) : Color.clear)

       
    
       
    }
}


struct SweetProductItem_Previews: PreviewProvider {
    static var previews: some View {
        let  productItem =  SweetProduct(id: "1",title: "Chocklate Cake ", description: "Dark Chocklate with truffle", price: "300Rs", image: "cherry")
       
        
        SweetProductItem(product: productItem, isSelected: false)
    }
}
