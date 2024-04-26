//
//  MultiSelectionViewDemo2.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 15/04/24.
//

import SwiftUI

struct SingleSelectionViewDemo2: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.presentationMode) private var presentationMode
    @StateObject var vm = MealViewModel()
    
   

    
    var body: some View {
       
        ZStack{
            
            Color(.white)

          
            VStack{
                
                //Mark : Header
                
                CustomHeader(title: "Single Selection Demo") {
                    dismiss()
                }
                ////////////////
                
                List{
                    
                    ForEach(vm.mealData){ mealObj in
                        
//                        MealDetailsModel(mealData: mealObj)
                        
                        CheckboxRow(meal: mealObj) {
                            
                            vm.toggleSelection(mealObj)
                            
                            print("Selected list", mealObj.name)
                        }
                        
                    }
                } .listRowInsets(EdgeInsets()) // Remove default padding
                    .listStyle(.plain)
            }
            .padding(.top, .topInsets)
            .padding(.bottom, .bottomInsets)
           
            
            .overlay(alignment: .top) {
               
               
                   Color.statusBar
                    .frame(height: .topInsets)
                    .ignoresSafeArea(.all,edges: .top)
                
            
                
            }
            
        }
            
        
            .navigationTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        

            .ignoresSafeArea()
        
           // .ignoresSafeArea(.all, edges: .bottom) // Optional: Ignore safe area for bottom content if needed

      
        
        .task {
            vm.getMeals()
        }
    }
}

private extension SingleSelectionViewDemo2 {
    
    func handleDismissAll(){
        
        if #available(iOS 15, *){
            
            dismiss()
        }else{
            presentationMode.wrappedValue.dismiss()
        }
    }
}

#Preview {
    SingleSelectionViewDemo2()
}
