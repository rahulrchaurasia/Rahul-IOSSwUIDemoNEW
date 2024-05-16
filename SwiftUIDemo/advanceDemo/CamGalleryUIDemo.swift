//
//  CamGalleryUIDemo.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 28/04/24.
//

import SwiftUI

struct CamGalleryUIDemo: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.presentationMode) private var presentationMode
    
    @State private var isActionSheetShow = false

    var body: some View {
        ZStack{
            
            Color(.bg)
            
            VStack(alignment: .center){
                
                
                
                // Both Same
                CustomHeaderWithMenu(title: "Cam Gallery Demo",
                                     dismissAction : { dismiss()
                      },
                                     menuAction: nil
                                     ,homeAction: nil)
                
                
                
                CamGalleryUIView()
                    .padding(.top,20)
                
            }
            .frame( maxHeight: .infinity, alignment: .top)

                .padding(.top, .topInsets)
                .padding(.bottom, .bottomInsets)
                
                
                .overlay(alignment: .top) {
                    
                    Color.statusBar
                        .frame(height: .topInsets)
                        .ignoresSafeArea()
                }
            
        }
       
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
        // Center the entire view vertically:
              
        
//        .sheet(isPresented: $vm.isShowingDetails) {
//
//            
//        }
        
        
//
        
        
        
    }
}

#Preview {
    CamGalleryUIDemo()
}
