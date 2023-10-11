//
//  MealDetailsModel.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 06/10/23.
//

import SwiftUI


struct MealDetailsModel: View {
    
    let mealData : MealData
     //@Binding var selectedItem : MealData?
    
     //@State var isSelected = false
    var body: some View {
        VStack(alignment: .leading, spacing: 10)
        {
            
            Divider()
            HStack(spacing: 8){
                Image("greenapple")
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100,height: 100,alignment: .topTrailing)
                
                    .background(Color.gray.opacity(0.3))
                    .clipShape(RoundedRectangle(cornerRadius: 16)
                               
                    )
                
                VStack(alignment: .leading, spacing: 10){
                    Text(mealData.name)
                        .font(.title2)
                    
                    Text("\(mealData.price.formatToTwoDecimalPlaces())")
                        .font(.headline)
                    Text(mealData.description)
                        .font(.caption)
                    
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                }.frame(maxWidth: .infinity)
                // .background(Color.red.opacity(0.1))
                
            }
           
            .frame(maxWidth: .infinity,alignment: .leading)
            
            .background(mealData.isSelected ? Color.blue.opacity(0.2) : Color.clear
            )
            .cornerRadius(mealData.isSelected ? 16 : 0)
               

            
            
            
            
            
            
        }
        //.padding(.horizontal,6)
        
        
    }
}

struct MealDetailsModel_Previews: PreviewProvider {
    static var previews: some View {
       // MealDetailsModel(mealData: myMealData)
        let myMealData = MealData(id: 101, name: "Name", description: "descriptionee edjee cec dekdnke kdeekdn ndkenkd wdwdw wdkwdk wdwd descriptionee edjee cec dekdnke kdeekdn ndkenkd wdwdw wdkwdk wdwd", price: 390, imageUrl: "")

        MealDetailsModel(mealData: myMealData)
    }
}
