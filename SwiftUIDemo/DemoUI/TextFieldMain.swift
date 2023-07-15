//
//  TextFieldMain.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 14/07/23.
//

import SwiftUI

struct TextFieldMain: View {
    @State private var showTextFielDemo1 = false
    @State private var showTextFielDemo2 = false
    var body: some View {
        VStack {
          
            if(showTextFielDemo1){
                
                TextFieldDemo()
            }else if(showTextFielDemo2){
                
                TextFieldDemo2()
                    .navigationBarBackButtonHidden(true)
                    .navigationTitle("TTT")
                    .navigationBarTitleDisplayMode(.large)
            }
            else{
                
               

    
                NavigationLink {
                    TextFieldDemo()
                } label: {
                    Text("Text demo1")
                        .padding(12)
                        .font(.title2)
                        .foregroundColor(.white)
                        .background(.red)
                        .cornerRadius(15)
                        
                }
                
                
                
                NavigationLink {
                    TextFieldDemo2()
                } label: {
                    Text("Text demo2")
                        .padding(12)
                        .font(.title2)
                        .foregroundColor(.white)
                        .background(.red)
                        .cornerRadius(15)
                        
                }
                
                NavigationLink {
                     ContactsDetailView()
                } label: {
                    Text("Contact Demo")
                        .padding(12)
                        .font(.title2)
                        .foregroundColor(.white)
                        .background(.red)
                        .cornerRadius(15)
                        
                }
                Menu {
                    Button("Demo 1", action: placeOrder)
                     Button("Demo 2", action: adjustOrder)
                } label: {
                    Text("TextField Demo")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }

               
            }
            
           Spacer()
        }.padding(.top,10)
    }
    
    func placeOrder() {
     
        showTextFielDemo1 = true
    }
    
    func adjustOrder() {
        
        showTextFielDemo2 = true
    }
}

struct TextFieldMain_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldMain()
    }
}
