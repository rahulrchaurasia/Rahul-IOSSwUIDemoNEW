//
//  CardView.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 30/12/23.
//

import SwiftUI

struct CardView: View {
    var food: Food
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10, content: {
                Text(food.title)
                    .fontWeight(.bold)

                Text(food.description)
                    .font(.caption)
                    .lineLimit(3)

                Text(food.price)
                    .fontWeight(.bold)
            })

            Spacer(minLength: 0)

            Image(food.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 130, height: 130)
                .cornerRadius(10)
        }
        .padding(.horizontal)
    }
}


struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        
        let  foodItem =  Food(id: "1",title: "Chocklate Cake ", description: "Dark Chocklate with truffle", price: "300Rs", image: "cherry")
        
        CardView(food: foodItem)
    }
}
