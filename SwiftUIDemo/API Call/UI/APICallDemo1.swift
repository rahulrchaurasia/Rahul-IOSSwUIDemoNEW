//
//  APICallDemo1.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 04/05/24.
//

import SwiftUI

struct APICallDemo1: View {
    
    @StateObject private var vm = LoginViewModel()
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.presentationMode) private var presentationMode
    @State private var showSuccessAlert = false
    
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
                
                VStack{
                    
                    CustomButton(title: "Call Api") {
                        
                        callVerifyOTPApi()
                           
                    }
                    .padding(.top,20)
                }.padding(.horizontal)
                
            
                
            }
            .frame( maxHeight: .infinity, alignment: .top)

                .padding(.top, .topInsets)
                .padding(.bottom, .bottomInsets)
                
                
                .overlay(alignment: .top) {
                    
                    Color.statusBar
                        .frame(height: .topInsets)
                        .ignoresSafeArea()
                }
            if vm.isLoading {

                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                    .scaleEffect(2)
            }
            else if let errorMessage = vm.errorMessage {
                                Text(errorMessage)
                                    .foregroundColor(.red)
            }
            
            
        }
       
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
        
        .alert(isPresented: $vm.isUserResponse) {
                    Alert(title: Text("Success"),
                          message: Text("API call was successful"),
                          dismissButton: .default(Text("OK"), action: {
                        // Navigate to another view or perform any additional actions
                        dismiss()
                    }))
                }
    }
    
    
    func callVerifyOTPApi() {
       
        Task{
            do  {
                
                let result = try await  vm.fetchUserData(email: "umesh@gmail.com")
             

//                if(vm.isUserResponse){
//                    showSuccessAlert = vm.showSuccessAlert
//                }else{
//                    handleFailure()
//                    
//                }
                
                
            } catch {
                
               // handleAPIError(error)
            }
        }
        
    }
}

#Preview {
    APICallDemo1()
}
