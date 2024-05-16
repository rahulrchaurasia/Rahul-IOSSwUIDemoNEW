//
//  CustomDashBoardViewModel.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 09/05/24.
//

import Foundation

class CustomDashBoardViewModel : ObservableObject {
    
    
    static var shared = CustomDashBoardViewModel()
    
    @Published var isOnline = false
    
    
    
    func actionGoOnline(){
        
        isOnline = !isOnline
       
        
    }
}
