//
//  CounterViewModel.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 10/10/23.
//

import Foundation

class CounterViewModel : ObservableObject {
    
    @Published var count = 0
    
    func increasedCount(){
        
        count += 1
    }
    func decreasedCount(){
        
        if count > 0 {
            
            count -= 1
        }
       
    }
    
    init(){
       print("Debug Did init..")
    }
    
    
}
