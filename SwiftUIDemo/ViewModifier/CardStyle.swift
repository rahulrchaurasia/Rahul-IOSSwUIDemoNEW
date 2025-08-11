//
//  CardStyle.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 06/08/25.
//


import SwiftUI
import SwiftUI

struct CardStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
                    .shadow(color: .black.opacity(0.2), radius: 1, y: 1)
            )
    }
}






//Mark : Showing the Example
struct CardStyleView: View {
    
    // Declare that you're using the NetworkMonitor
    
    
    var body: some View {
        VStack( spacing :10){
            
            Text("Hello Card!")
                .padding()
                .cardStyle()
            
            Text("Details of card data Card!")
                .padding()
                .cardStyle()
        }
        
        
    }
}

#Preview {
    CardStyleView()
}
           
