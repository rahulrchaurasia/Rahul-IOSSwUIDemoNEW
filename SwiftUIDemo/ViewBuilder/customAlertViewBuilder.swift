//
//  customAlertViewBuilder.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 01/10/23.
//

import Foundation
import SwiftUI


struct customAlertView<Content : View> : View {
   
    
    let content : Content
    
    init(@ViewBuilder content : () -> Content ) {
        
        self.content = content()
        
    }
    
    var body: some View{
        
        VStack{
            
            content
                .padding()
            Divider()
            HStack{
                
                Button {
                   
                } label: {
                   Text("Cancel")
                        .bold()
                        .foregroundColor(.red)
                }
                
                Button {
                   
                } label: {
                   Text("Confirm")
                        .bold()
                       
                    
                }

            }
            
        }
   
        frame(width: UIScreen.main.bounds.size.width / 2)
        .background(Color.blue)
        .cornerRadius(7)
        .padding()
        
    }
    
}
