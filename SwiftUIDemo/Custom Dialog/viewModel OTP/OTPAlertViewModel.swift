//
//  OTPAlertViewModel.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 02/02/24.
//

import Foundation



@MainActor class OTPAlertViewModel : ObservableObject {
    
    
    @Published var isShowingDetails = false
    
    @Published var dynamicText : String = ""
    
    @Published var isValid = true
    var errorMessage = ""
    
    func dismissAlert() {
        Task {
            await MainActor.run {
                
                isShowingDetails = false
            }
        }
           
    }
    
    func handleCustomPopUp(){
        
    
        Task {
            await MainActor.run {
                
                isShowingDetails = true
            }
        }
    }
    
 
    
    func validateOTP(strCode : String) -> Bool {
      
        if strCode.isEmpty {
            errorMessage = "Please enter data."
            isValid = false
        } else if strCode.count < 4 {
            errorMessage = "Minimum 3 characters required."
            isValid = false
        } else {
            errorMessage = "" // Clear any previous error message
            isValid = true
        }
        return isValid
    }
    
    
    func validateOTP1(strCode : String) ->( Bool,String) {
      
        var isVerify : Bool = false
        var strMessage = ""
        if strCode.isEmpty {
            strMessage = "Please enter data."
            isVerify = false
        } else if strCode.count < 4 {
            strMessage = "Minimum 3 characters required."
            isVerify = false
        } else if strCode != "0000" {
            strMessage = "Enter Valid OTP."
            isVerify = false
        } 
        else if strCode == "0000" {
            strMessage = "Enter Valid OTP."
            isVerify = true
        }else {
            strMessage = "" // Clear any previous error message
            isVerify = true
        }
        return (isVerify,strMessage)
    }
    
    init(){
        
        print("Init is Called...")
    }
    
    //Note : Class need init if we paas variable which is not initializes.
    
//    init(dynamicText: String) {
//           self.dynamicText = dynamicText
//       }
    
}


struct OTPAlertValidation{
    
    var  isValid : Bool = true
    var  code : String = ""
    var  errorMessage : String = ""
    
   mutating func validateOTP() -> Bool {
        if code.count != 4 {
            isValid = false
            errorMessage = "Please enter a valid OTP."
        } else {
            isValid = true
             errorMessage = ""
        }
       return isValid
    }
}
