//
//  SupportMessageView.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 07/05/24.
//

import SwiftUI

struct SupportMessageView: View {
    
   
    @StateObject var sVM = SupportViewModel.shared
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack{
            
        
            VStack(spacing: 0 , content: {
                
                HStack{
                    Button(action: {
                       dismiss()
                    }, label: {
                        Image("back")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                    })
                    
                    HStack{
                        Image("u1")
                            .resizable()
                            .scaledToFill()
                            .cornerRadius(17.5)
                            .frame(width: 35, height: 35)
                            .clipped()
                        
                        Text("User1")
                            .font(.customfont(.bold, fontSize: 17))
                            .frame(maxWidth: .infinity, alignment : .leading)
                    }
                    
                    NavigationLink {
                        SupportUserView()
                    } label: {
                        Text("Clear All")
                            .font(.customfont(.bold, fontSize: 17))
                        
                    }
                    .foregroundColor(.primaryApp)
                                        
                }
                .padding(.bottom , 8)
                .padding(.horizontal, 20)
                .padding(.top, .topInsets)
                
                Rectangle()
                    .fill(Color.lightWhite)
                    .frame(height: 2)
                    
                Spacer()
                // here our contents
                Rectangle()
                    .fill(Color.lightWhite)
                    .frame(height: 2)
                    .padding(.bottom, 8)
                    
                
                HStack(spacing: 0){
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text( sVM.txtMessage == "" ? "Type Here"  : "")
                            .padding(8)
                            .foregroundColor(.placeholder)
                        
                        
                        TextEditor(text: $sVM.txtMessage)
                            .frame(minHeight:  40, alignment: .leading)
                            .frame(maxHeight: 90)
                            .cornerRadius(10, antialiased: true)
                            .foregroundColor(.primaryText)
                            .font(.customfont(.regular, fontSize: 17))
                            .fixedSize(horizontal: false, vertical: true)
                            .multilineTextAlignment(.leading)
                            
                            
                        
                    })
                    
                    Button(action: {
                        
                        if sVM.txtMessage.isEmpty {
                            return
                        }
                       // sVM.sendMessageApi()
                        
                    }, label: {
                        Image( systemName: "paperplane.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                    })
                    .foregroundColor(.primaryApp)
                    
                    
                    
                }
                .padding(.horizontal)
                .padding(.vertical,4)
                .background(Color.lightWhite)
                .cornerRadius(30)
                .padding(.horizontal, 15)
                .padding(.bottom , .bottomInsets + 2)
                
                
            }).frame(maxHeight: .infinity,alignment: .top)
            
        }
        .alert(isPresented: $sVM.showError, content: {
            
            Alert(title: Text("Driver App"), message: Text(sVM.errorMessage), dismissButton: .default(Text("OK")) {
                
            } )
        })
        .onAppear(){
            UITextView.appearance().backgroundColor = .clear
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden()
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    SupportMessageView()
}
