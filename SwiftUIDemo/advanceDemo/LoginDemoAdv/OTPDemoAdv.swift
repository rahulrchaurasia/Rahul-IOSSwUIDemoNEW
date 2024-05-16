//
//  OTPDemoAdv.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 15/05/24.
//

import SwiftUI

struct OTPDemoAdv: View {
    
    @Environment(\.dismiss) private var dismiss
    @State var txtOTP : String = ""
    @State var isShowingAlert : Bool = false
    @State var isShowingSheet : Bool = false
    @StateObject private var vm = LoginViewModel()
    
    @StateObject var vmAlert =  OTPAlertViewModel()
    var body: some View {
       
        ZStack{
            
            VStack(alignment: .leading, spacing : 0){
                
                ZStack{
                    HStack{
                        
                        Button(action: {
                            isShowingAlert = true
                        }, label: {
                           
                            Image("back")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                            
                        })
                        
                        Spacer()
                    }
                }
                .padding(.top,.topInsets)
                
               
                Text("OTP Verification")
                    .font(.customfont(.extraBold, fontSize: 25))
                    .foregroundStyle(Color.primaryText)
                    .padding([.top,.leading],10)
                
                Text("Enter 6 digit code sent you at mobile no.")
                    .font(.customfont(.regular, fontSize: 15))
                    .foregroundStyle(Color.secondaryText)
                    .padding(.top,20)
                    .padding(.leading,10)
                    .padding(.bottom,30)
                
                OTPTextFieldView(txtOTP: $txtOTP)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .center)
                    .padding(.leading,-20)
                
                
            
                
                VStack {
                    CustomButton(title: "Validate OTP") {
                        
                        //print($txtOTP)
                        isShowingAlert = true
                       
                    }
                    .padding(.top,30)
                    
                    CustomButton(title: "ReSend") {
                        
                        //print($txtOTP)
                        isShowingSheet = true
                       
                    }
                    .padding(.top,15)
                }
               
                
                .padding(.horizontal,20)
                
                Spacer()
            }
            .padding(.horizontal,20)
            .alert(isPresented: $isShowingAlert) {
                Alert(title: Text("OTP Data"),
                      message: Text("MY Data  \(txtOTP)"),
                      dismissButton: .default(Text("Done"), action: {
                  
                }))
            }
            .sheet(isPresented: $isShowingSheet) {
                
                        if #available(iOS 16.0, *) {
                           
                            OTPSheetView(vm: OTPAlertViewModel())
                        
                                
                                .presentationDetents([.medium, .large])
                        } else {
                            OTPSheetView(vm: OTPAlertViewModel())
                              
                        
                               
                        }
                    }
            
            
            
            
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden()
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    OTPDemoAdv(txtOTP: "22")
}
