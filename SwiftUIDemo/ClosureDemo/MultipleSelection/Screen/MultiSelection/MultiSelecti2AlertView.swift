//
//  MultiSelecti2AlertView.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 25/04/24.
//

import SwiftUI

struct MultiSelecti2AlertView: View {
    
    @ObservedObject var vm : MealViewModel
    
    //@Binding var isShowingDetails : Bool
    // IF We Not getting data from ViewModel then use @Binding so chnage on this variable also reflect the parent one
    
    let selectedList : [MealData]
    
    
    var body: some View {
        VStack{
            
            HStack{
                
                
                Text("Meals")
                    .font(.title) // Customize the title font and
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.blue)
            
            List{
                
                ForEach(selectedList){   meal in
                    
                    
                    MealDetailsModel(mealData: meal)
                        
                    
                }
            }
            .listRowInsets(EdgeInsets()) // Remove default padding
            .listStyle(.plain)
           

            VStack{
                Divider()
                    
                    .background(Color.blue.opacity(0.4))
                
                // Text(displaySelection())
                
                Button {
                    
            // we use @Binding Hence Parent View also reflect when change is done here
                    vm.isShowingDetails = false
                    print("Close")
                } label: {
                    APButton(title: "Done")
                }

            }
            
        }
        
        
//        .task {
//            vm.getSlectedMultiSelectMeals()
//        }
        
    }
        
    
}

struct MultiSelecti2AlertView_Previews: PreviewProvider {
    static var previews: some View {

        let vm: MealViewModel = MealViewModel()
        var mealData : [MealData] = [
               MealData(id: 101, name: "Butter Chicken", description: "Butter with spicy masla, kce cecje", price: 450, imageUrl: "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg")
        ]

    
        //MultiSelectionAlertView(vm: vm)
        MultiSelecti2AlertView(vm: vm,  selectedList: mealData)
    }
}
