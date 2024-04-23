//
//  MultiSelectionViewDemo2.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 15/04/24.
//

import SwiftUI

struct SingleSelectionViewDemo2: View {
    
    @StateObject var vm = MealViewModel()
    
    var body: some View {
       
        ZStack{
            VStack{
                HStack{
                   
                    
                    Text("MultiSelect Demo")
                        .font(.title) // Customize the title font and
                }
                .frame(maxWidth: .infinity)
                List{
                    
                    ForEach(vm.mealData){ mealObj in
                        
//                        MealDetailsModel(mealData: mealObj)
                        
                        CheckboxRow(meal: mealObj, isCheck: mealObj.isSelected) {
                            
                            vm
                        }
                        
                    }
                } .listRowInsets(EdgeInsets()) // Remove default padding
                    .listStyle(.plain)
            }
            .padding(.top, .topInsets)
            .padding(.bottom, .bottomInsets)
            
            .overlay(alignment: .top) {
               
               
                   Color.primaryApp
                    .frame(height: .topInsets)
                    .ignoresSafeArea(.all,edges: .top)
            }
        }
            
        
            .navigationTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .ignoresSafeArea()
        
            
      
        
        .task {
            vm.getMeals()
        }
    }
}

#Preview {
    SingleSelectionViewDemo2()
}
