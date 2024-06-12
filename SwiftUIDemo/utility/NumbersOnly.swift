//
//  NumbersOnly.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 10/06/24.
//

import Foundation

class NumbersOnly : ObservableObject {
    
    
    @Published var value = "" {
        
        
        didSet {
            
            let filtered = value.filter { $0.isNumber}
            
            if value != filtered {
                
                value = filtered
            }
        }
    }
}
