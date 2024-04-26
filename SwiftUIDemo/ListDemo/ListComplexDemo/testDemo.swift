//
//  testDemo.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 13/04/24.
//

import SwiftUI

struct testDemo: View {
    var body: some View {
        VStack{
            HStack( spacing: 15) {
             
                Image("u1")
                    .resizable()
                   
                    .frame(width: 60.0, height: 60.0)
                    .cornerRadius(30)
                
                VStack{
                    
                    HStack{
                        
                        Text("Order Summary")
                            .font(.customfont(.bold, fontSize: 20))
                            .foregroundColor(.primaryText)
                        Image(systemName: "pencil")
                            .foregroundStyle(Color(.black))
                        
                        Spacer()
                    }
                    
                    Text("codeforany@gmail.com")
                        .font(.system(size: 16,weight: .thin))
                        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,  maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,  alignment: .leading)
                        .tint(.gray40)
                }
                   
            }.padding(.horizontal,20)
                .padding(.leading,20)
            
            
        }
            .overlay(alignment: .topLeading) {
                Button {
                   //dismiss()
                } label: {
                   Image("back")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20,height: 20)
                    
                        .padding(.leading,10)
                        .padding(.top, 10)
                }
            }
            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,  maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,  alignment: .leading)
            .background(Color("skyblue"))
   
    }
}

#Preview {
    testDemo()
}
