//
//  MultiSelectionViewDemo2.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 22/04/24.
//

//Note : scrollIndicators(ScrollIndicatorVisibility.hidden)
// For Hiding ScrollIndicator in List

import SwiftUI

struct MultiSelectionViewDemo2: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.presentationMode) private var presentationMode
    @StateObject var vm = MealViewModel()
    
   // @State private var showingAlert = false
    
    
    
    var body: some View {
        ZStack{
            
            Color(.bg)
            
            VStack{
                
                //                CustomHeaderWithMenu(title: "Multi- Selection Demo")
                //                {
                //                    dismiss()
                //                }
                //                CustomHeaderWithMenu(title: "Multi- Selection Demo")  {
                //                    dismiss()
                //                } menuAction: {
                //                    dismiss()
                //                } homeAction: {
                //                    dismiss()
                //                }
                
                // Both Same
                CustomHeaderWithMenu(title: "Preview Title",
                                     dismissAction: {dismiss() },
                                     menuAction: {
                    
                                       vm.handleDetailAlert()
                    
                                    },homeAction: nil)
                
                
                List{
                    
                    ForEach(vm.mealData){ mealObj in
                        
                        MultiCheckboxRow(meal: mealObj , viewModel: vm)  // Pass both meal and view model
                        
                        
                        
                    }
                }
                    //                      .scrollIndicators(ScrollIndicatorVisibility.hidden)
                .listStyle(.plain)
                .scrollIndicatorsCustomModifier()
                
                
            }
            .padding(.top, .topInsets)
            .padding(.bottom, .bottomInsets)
            
            
            .overlay(alignment: .top) {
                
                Color.statusBar
                    .foregroundStyle(Color.white)
                    .frame(height: .topInsets)
                    .ignoresSafeArea()
            }
            
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
        .task {
            vm.getMeals()
        }
        .sheet(isPresented: $vm.isShowingDetails) {
          
            
            if(!vm.getSlectedMultiSelectMeals().isEmpty){
                
                if #available(iOS 16.0, *) {
                    
                   
                    MultiSelecti2AlertView(vm: vm,  selectedList: vm.getSlectedMultiSelectMeals())
                    
                        .presentationDetents([.medium,.large])
                } else {
                    MultiSelecti2AlertView(vm: vm,selectedList: vm.getSlectedMultiSelectMeals())
                    
                    
                    
                }
            }
            
        }
        .alert(isPresented: $vm.errorAlert, content: getAlert)

        
        
        
    }

     
      
    func getAlert() -> Alert {
        
        return Alert(title: Text(vm.alertTitle)
                     
        )
    }
   
}


#Preview {
    MultiSelectionViewDemo2()
}
