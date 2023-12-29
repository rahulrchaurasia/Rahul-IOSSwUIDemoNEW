//
//  PinnedViewList.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 25/12/23.
//

import SwiftUI

struct PinnedViewList: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
       
        ZStack{
            Color(.white)
                .ignoresSafeArea()
            ScrollView (showsIndicators: false){
               
                LazyVStack(alignment: .leading, spacing: 15, pinnedViews: .sectionHeaders, content: {
                   
        
                    Section {
                       
                        ForEach(sweetProductList){ product in
                            
                           SweetProductItem(product: product)
                            
                           
                        }
                    } header: {
                        Text("Title")
                            .font(.title2)
                            .font(.system(size: 20,weight: .heavy))
                    }

                    
                })
               
            }
            
            .padding(.bottom, .bottomInsets)
           
        }
//            .navigationBarHidden(true)
       
            .navigationTitle("Your Title") // Set the desired title
            .navigationBarTitleDisplayMode(.inline) // Ensure title is inline
            .navigationBarBackButtonHidden(true) // Hide the back button
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

                        Text("Move to back")
                            .font(.headline) // Customize the title font and
                    }

                }
            }
        
        
       
      
           
    }
}


private extension PinnedViewList {
    
    func handleDismissAll(){
        
        if #available(iOS 15, *){
            
            dismiss()
        }else{
            presentationMode.wrappedValue.dismiss()
        }
    }
}

#Preview {
    PinnedViewList()
}
