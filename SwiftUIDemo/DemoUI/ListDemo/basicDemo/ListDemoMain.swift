//
//  ListDemo.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 21/07/23.
//

import SwiftUI

struct ListDemoMain: View {
    
   
    @StateObject private var vm = ListMainViewModel()
   
    @Environment(\.dismiss) private var dismiss
    @Environment(\.presentationMode) private var presentationMode
    
   
    var body: some View {
        
        
        VStack{
            
            // Using ViewBuilder
//            CustomNavigationBar(title: "List with Multiline Text") {
//
//                print("Text")
//            } content: {
//
//
         //   }

            
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack{
                    ForEach(vm.listData) { item in
                        ListDemoItem(item: item)
                    }
                }
               
            }
            //.padding(.top, -15)
            
            Spacer()
        }
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
      //  .navigationBarHidden(true)
   
        .toolbar{
            
            ToolbarItem(placement: .principal) {
                    VStack {
                        Text("Real Title").font(.headline)
                       
                    }
                }
            ToolbarItem(placement: .navigationBarLeading) {

                HStack(spacing: 10){
                    Button {

                        handleDismissAll()
                    } label: {
                        Image(systemName: "arrow.left")
                    }

                    Text("List Demo")
                        .font(.headline) // Customize the title font and
                }

            }
        }
        
        
    }
}

private extension ListDemoMain {
    
    func handleDismissAll(){
        
        if #available(iOS 15, *){
            
            dismiss()
        }else{
            presentationMode.wrappedValue.dismiss()
        }
    }
}

struct ListDemoMain_Previews: PreviewProvider {
    static var previews: some View {
        ListDemoMain()
    }
}

struct ListMainModel : Identifiable{
    
    var id : Int
    var name : String
    var data : String
    var subData : String
   
}

