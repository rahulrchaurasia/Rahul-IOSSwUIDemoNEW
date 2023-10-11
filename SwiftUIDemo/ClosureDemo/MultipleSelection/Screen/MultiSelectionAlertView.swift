//
//  MultiSelectionAlertView.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 08/10/23.
//

import SwiftUI

struct MultiSelectionAlertView: View {
    
   
    @ObservedObject var vm: MealViewModel
    @Binding var isShowingDetail: Bool
    
    // Not in Used {Logic for current List Only..}
    @State private var selectedItems: MealData? = nil //
    
    
  //  @State private var selection: String?
   
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
                
                ForEach(vm.mealData){   mealObj in
                    
                    
                    MealDetailsModel(mealData: mealObj)
                        .onTapGesture {
                          //  vm.selectedMeal(mealObj)
                            selectedItems = mealObj // for Showing Item in Current AlertView
                            vm.selectMeal( mealObj)
                        }
                    
                }
            }
            .listRowInsets(EdgeInsets()) // Remove default padding
            .listStyle(.plain)
            .toolbar {
                            EditButton()
                        }
            

//            ScrollView(.vertical,showsIndicators: false){
//
//                LazyVStack{
//
//                    ForEach(vm.mealData){  mealObj in
//
//                        MealDetailsModel(mealData: mealObj)
//                    }
//                }
//            }
            
            VStack{
                Divider()
                    
                    .background(Color.blue.opacity(0.4))
                
                if let myData = selectedItems {
                    
                    Text(myData.name)
                        .font(.title2)
                    
                        .foregroundColor(.brown)
                }
               // Text(displaySelection())
                
                Button {
                   
                    vm.isShowingDetails = false
                    print("Close")
                } label: {
                    APButton(title: "Done")
                }

            }
            
        }
        
        .frame(width: UIScreen.main.bounds.width - 30 , height: 600)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)

        
        .overlay(alignment: .topTrailing) {
          
            Button {
                vm.isShowingDetails = false
            } label: {
                XDismissButton()
            }

        }
        
    }
    
    
//    private func displaySelection() -> String {
//            var displayedString = ""
//
//            // Iterate over the selection using a ForEach loop.
//        for element in selectedItems {
//                // Add each element of the selection to the displayed string.
//            displayedString += element.name
//
//                // Add a space between each element.
//                displayedString += " "
//            }
//
//            // Remove the trailing space from the displayed string.
//            displayedString = displayedString.trimmingCharacters(in: .whitespacesAndNewlines)
//
//            return displayedString
//        }
//
}

struct MultiSelectionAlertView_Previews: PreviewProvider {
    static var previews: some View {

        let vm: MealViewModel = MealViewModel()
        //MultiSelectionAlertView(vm: vm)
        MultiSelectionAlertView(vm: vm, isShowingDetail: .constant(true))
    }
}
