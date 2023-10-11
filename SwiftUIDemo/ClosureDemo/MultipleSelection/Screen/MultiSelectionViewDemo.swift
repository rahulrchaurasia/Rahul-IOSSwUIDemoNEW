//
//  MultiSelectionViewDemo.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 06/10/23.
//

import SwiftUI

struct MultiSelectionViewDemo: View {
    
    @StateObject var vm = MealViewModel()
    
    //@State private var selectedItems: [MealData] = []

   
    @State var isShowingDetails = false
    
    @State private var selectedRow: Int? = nil
    @State private var items = ["Item 1", "Item 2", "Item 3","Item 4","Item 5","Item 6",
         "Item 7","Item 8","Item 9","Item 10"]
    
    var body: some View {
        
        ZStack{
            
            Color(.systemBackground)
                .ignoresSafeArea()
            
            
            VStack{
                Text("hi")
                Button("Demo") {
                    print("Click work....")
                }
              
                List(selection: $selectedRow ){
                   
                    ForEach(0..<items.count, id: \.self) { index in
                       
                        
                        Text(items[index])
                            .tag(index)
                    }
                }.listStyle(.plain)
                    .frame(maxHeight: 200)
                    
                
         
                Text("Selected items: \(vm.selectedMeal?.name ?? "")")
                
                Spacer()
            }
            .disabled(true)
        
            .blur(radius: vm.isShowingDetails ? 10 : 0)
            if vm.isShowingDetails {

                MultiSelectionAlertView(vm: vm, isShowingDetail: $vm.isShowingDetails)
            }
        }
        .navigationTitle("Multi Selection Demo")
        .navigationBarBackButtonHidden(vm.isShowingDetails)
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button {
                    print("Done")
                    
                    vm.isShowingDetails = true
                    
//
                } label: {
                    Image(systemName: "plus")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20)
                }
            }
        }
        
        .onAppear(){
            vm.getMeals()
        }
       
       
    }
           
            
    
}

struct MultiSelectionViewDemo_Previews: PreviewProvider {
    static var previews: some View {
        MultiSelectionViewDemo()
    }
}
