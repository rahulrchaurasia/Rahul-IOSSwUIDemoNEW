//
//  ViewBuilderDemo.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 14/06/23.
//

import Foundation

import SwiftUI


struct ViewBuilderDemo: View {
    @State var showSecondaryText: Bool = false
    
    var body: some View {
        ScrollView(){
            
            VStack(spacing: 10){
                
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
                            Image(systemName: "heart.fill")
                            Text("Done")
                        }
                        
                    }
                    
                    Spacer()
                }
            }
        }
        
     
    }
}
