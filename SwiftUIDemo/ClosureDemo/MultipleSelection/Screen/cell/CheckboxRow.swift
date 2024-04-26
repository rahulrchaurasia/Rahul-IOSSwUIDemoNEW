//
//  CheckboxRow.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 15/04/24.
//

import SwiftUI

struct CheckboxRow: View {
    
    let meal : MealData
  
    let action: ()-> Void
    
    
   
    
    var body: some View {
            Button(action: action) {
                HStack {
                    Image(systemName: meal.isSelected ? "checkmark.square" : "square")
                        .foregroundStyle(meal.isSelected ? Color.accentColor :  Color.secondary)
                    VStack(alignment: .leading) {
                                    Text(meal.name)
                                        .font(.headline)
                                    Text(meal.description)
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                    Text("$\(meal.price, specifier: "%.2f")")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                }
                }
            }
        
       
        
       
        }
}



struct CheckboxRow_Previews: PreviewProvider {
    static var previews: some View {
        let meal = MealData(id: 1, name: "Burger", description: "Hot spicy Burger", price: 220, imageUrl: "")
        CheckboxRow(meal: meal, action: {})
    }
}
