//
//  StickyCardView.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 01/04/23.
//

import SwiftUI

struct StickyCardView: View {
    
    var food : Food1
    var body: some View {
        
        //Text(food.title)
        HStack{
            VStack(alignment: .leading,spacing: 10)   {
                Text(food.title)
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text(food.description)
                    .font(.caption)
                    .lineLimit(3)
                
                Text(food.price)
                    .fontWeight(.semibold)
                    
            }
            Spacer(minLength: 10)
            Image(food.image)
                .resizable()
                .aspectRatio( contentMode: .fill)
                .frame(width: 130,height: 130)
                .background(
                    Color.red.opacity(0.7)
                )
                .cornerRadius(10)
            
        }.padding(.horizontal)
        //.background(Color.green.opacity(0.7) )
    }
}

struct StickyCardView_Previews: PreviewProvider {
    static var previews: some View {
        
        let food = Food1(title: "Cookies", description: "Cookies desc", price: "300RS", image: "citrus")
        StickyCardView(food: food)
    }
}
