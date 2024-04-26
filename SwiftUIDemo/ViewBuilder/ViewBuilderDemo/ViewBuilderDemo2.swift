//
//  ViewBuilderDemo2.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 02/01/24.
//

import SwiftUI

struct ViewBuilderDemo2: View {
    
    @StateObject var vm = ProductCardViewModel()
    @State var showSecondaryText: Bool = false
    var body: some View {
        
        VStack{
          
            VStack {
                
                Text("In the ContentView, we use the PrimaryTextView and conditionally include a secondary text view based on the showSecondaryText flag. The @ViewBuilder closure allows us to construct the view hierarchy dynamically based on this condition. ")
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                Button("Click Here") {
                    showSecondaryText.toggle()
                }.padding(.bottom,20)
                
                
                PrimaryTextView {
                    Text("Primary Text")
                        .font(.title)
                        .foregroundColor(.blue)
                    
                    if showSecondaryText {
                        Text("Secondary Text")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
            }
            
            
            VStack{
                CustomContainerView {
                    Text("Child View 1")
                        .foregroundColor(.blue)
                    Text("Child View 2")
                        .foregroundColor(.green)
                    Text("Child View 3")
                        .foregroundColor(.red)
                }
                
            }
            
            VStack{
                
                
                HeaderViewGeneric(title: "Generic Title") {
                    HStack{
                        Text("Hi")
                            .font(.title2)
                            .fontWeight(.heavy)
                        Image(systemName: "heart.fill")
                        Text("Done")
                    }
                    
                }
                
               
            }
            
            ScrollView(.horizontal,showsIndicators: false){
                HStack{
                    ForEach(vm.productCardLst){prditem in
                        
                        ProductCardView(strImage: prditem.imgName)
                    }
                    .padding(.trailing)
                }
            }
            .padding(.leading)
              
            
            
           
            Spacer()
        }
        
        .onAppear{
            
            Task {
                
                try await vm.getItems()
            }
        }
    }
        
}


private extension ViewBuilderDemo2 {
    
    var ProductCardView1 : some View {
        Group{
        }
       
    }
    
   
}

#Preview {
    ViewBuilderDemo2()
}



