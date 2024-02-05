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
    
    func dismissAlert() {
            isShowingDetails = false
    }
    
    func handleCustomPopUp(){
        
        isShowingDetails = true
    }
    
    init(){
        
        print("Init is Called...")
    }
    
    //Note : Class need init if we paas variable whichis not initializes.
    
//    init(dynamicText: String) {
//           self.dynamicText = dynamicText
//       }
    
}
