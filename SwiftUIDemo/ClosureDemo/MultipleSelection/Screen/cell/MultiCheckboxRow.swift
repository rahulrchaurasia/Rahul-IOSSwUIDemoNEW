//
//  MultiCheckboxRow.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 22/04/24.
//

import SwiftUI

struct MultiCheckboxRow: View {
    
      let meal: MealData
      let viewModel: MealViewModel // Inject the view model instance

    var body: some View {
       
        
        Button(action: {
            
           // meal.isSelected  = meal.isSelected.t
            viewModel.toggleMultiSelection(meal)
            
        }, label: {
          
            HStack {
              Image(systemName: meal.isSelected ? "checkmark.square" : "square")
                .foregroundStyle(meal.isSelected ? Color.accentColor : Color.secondary)
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
            .frame(maxWidth: .infinity,alignment: .leading)
            .background(
                meal.isSelected ?
                Color.secondary.opacity(0.2) : Color.clear
            )
            .cornerRadius(8)
           
        })
  
        
    }
}

struct MultiCheckboxRow_Previews: PreviewProvider {
    static var previews: some View {
        let meal = MealData(id: 1, name: "Burger", description: "Hot spicy Burger", price: 220, imageUrl: "",isSelected: true)
        CheckboxRow(meal: meal, action: {})
        
    }
}
