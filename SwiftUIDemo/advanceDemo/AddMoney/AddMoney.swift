//
//  AddMoney.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 13/05/24.
//

import SwiftUI

struct AddMoney: View {
    
    @Environment(\.dismiss) private var dismiss
    var body: some View {
       
        ZStack{
            
            VStack(alignment: .leading, spacing : 0){
                
                ZStack{
                    
                    Text("Add Money")
                        .font(.customfont(.extraBold, fontSize: 25))
                        .foregroundStyle(Color.primaryText)
                    
                    HStack{
                        
                        Button {
                           dismiss()
                        } label: {
                            Image("back")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                        }

                       
                        
                        Spacer()
                        
                    }
                }
                .padding(.horizontal,20)
                .padding(.bottom,10)
                .padding(.top,.topInsets)
               
                //Seperator
                Group{
                    Divider()
                        
                    Rectangle()
                        .fill(Color.lightWhite)
                        .frame(height: 8)
                        
                }
                
                HStack{
                  
                    Text("Available balance")
                        .font(.customfont(.medium, fontSize: 16))
                        .foregroundStyle(Color.secondaryText)
                    
                    Spacer()
                    
                    Text("$54.75")
                        .font(.customfont(.medium, fontSize: 16))
                        .foregroundStyle(Color.secondaryText)
                    
                }
                .padding(20)
                
                HStack{

                    Text("$")
                        .font(.customfont(.medium, fontSize: 22))
                        .foregroundStyle(Color.gray)
                    

                    
                    Text("48")
                        .font(.customfont(.medium, fontSize: 22))
                        .foregroundStyle(Color.primaryText)
                    
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                .padding(.leading,40)
                
                HStack(spacing:10){
                    
                    Button(action: {
                        
                    }, label: {
                       
                        RectangleBorderView(strText: "+10")
                    })
                    Button(action: {
                        
                    }, label: {
                       
                        RectangleBorderView(strText: "+20")
                    })
                    Button(action: {
                        
                    }, label: {
                       
                        RectangleBorderView(strText: "+30")
                    })
                    
                   
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                .padding([.bottom, .leading],20)
                
                
                //Seperator
                Group{
                    Divider()
                        
                    Rectangle()
                        .fill(Color.lightWhite)
                        .frame(height: 8)
                        
                }
                
                Text("From Bank Account")
                    .font(.customfont(.medium, fontSize: 16))
                    .foregroundStyle(Color.primaryText.opacity(0.8))
                    .padding(.leading,20)
                    .padding(.top,20)
                
                
                HStack {
                    
                    Image("bank_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60,height: 60)
                    
                    VStack( alignment: .leading, spacing: 10){
                        
                        Text("Standard Charted Bank")
                            .font(.customfont(.medium, fontSize: 16))
                            .foregroundStyle(Color.primaryText.opacity(0.8))
                        
                        Text("***378")
                            .font(.customfont(.medium, fontSize: 16))
                            .foregroundStyle(Color.secondaryText)
                            
                    }
                }
                .padding(.horizontal, 10)
                
                
                RoundButton(title: "Submit Request") {
                    
                    print("Data...")
                }
                .padding(.horizontal, 30)
                .padding(.top,20)
                    
                
                
              
                
               
           
                
                  Spacer()
                
            }
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden()
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    AddMoney()
}
