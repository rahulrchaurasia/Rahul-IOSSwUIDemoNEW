//
//  MultiSelectionViewDemo.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 06/10/23.
//

/*
 Table : having wrap content not match parent.
 Note : If we take List it default behavior is take all space hence we have to use
   Normal ForEach Loop bec we need no default style
 */

// Symbol(systemName: "heart.fill")
//.symbolVariant(.fill)
/*
 There are several different SymbolVariants values that you can use, including:

 .fill: This fills the symbol with the system color.
 .circle: This encases the symbol in a circle.
 .square: This encases the symbol in a square.
 .rectangle: This encases the symbol in a rectangle.

 */
import SwiftUI

struct MultiSelectionViewDemo: View {
    
    @StateObject var vm = MealViewModel()
    
    //@State private var selectedItems: [MealData] = []

   
    @State var isShowingDetails = false
    
    @State private var selectedRow: Int? = nil
    @State private var items = ["Item 1", "Item 2", "Item 3","Item 4","Item 5","Item 6",
         "Item 7","Item 8","Item 9","Item 10"]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack{
                ZStack{
                    
                    Color(.systemBackground)
                        .ignoresSafeArea()
                    
                    
                    VStack{
                        Text("hi")
                            .font(.title2)
                        Button("Demo") {
                            print("Click work....")
                        }
                        
                        HStack {
                            Image(systemName: "heart")
                            Image(systemName: "star")
                        }
                        .symbolVariant(.fill)
                        
                            ForEach(0..<items.count, id: \.self) { index in
                                
                                
                                Text(items[index])
                                    .tag(index)
                                    .font(.title2)
                                    .frame(width:UIScreen.main.bounds.width - 20,
                                           height: 50,
                                           alignment: .center)
                                    .background(
                                        
                                        Rectangle().stroke(Color.gray.opacity(0.5), lineWidth: 2)
                                    )
                                
                            }
                        
                        //.frame(maxHeight: 100)
                        
                        
                        .padding(.horizontal,10)
                        //listStyle(.inset)
                        //.frame(maxHeight: 300)
                        
                        //.frame(maxHeight: .none)
                        
                        Text("Selected items: \(vm.selectedMeal?.name ?? "")")
                        
                        Spacer()
                    }
                  
                   // .offset(y:100)
                    .disabled(true)
                    
                    .blur(radius: vm.isShowingDetails ? 10 : 0)
                    if vm.isShowingDetails {
                        
                        MultiSelectionAlertView(vm: vm, isShowingDetail: $vm.isShowingDetails)
                    }
                }
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
