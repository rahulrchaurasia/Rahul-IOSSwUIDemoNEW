//
//  OvalTextView.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 27/12/23.
//

import SwiftUI
//  .shadow(radius: shadowRadius, x: 0, y: shadowYOffset)
struct OvalTextView: View {
    var text: String
       var borderWidth: CGFloat
      
    var body: some View {
        VStack {
                  
                  // Text with border
                  Text(text)
                .font(.caption)
                .font(.system(size: 15,weight: .semibold))
                .foregroundColor(.white)
                .padding(.vertical,10)
                .padding(.horizontal,20)
                
                     
                      .overlay(
                        RoundedRectangle(cornerRadius: 20) // Adjust corner radius for oval shape
                           
                            .stroke(Color.appblack.opacity(0.7), lineWidth: 3)
                            
                    
                        
                      )
                      .background(RoundedRectangle(cornerRadius: 20)
                        .fill(Color.appBackground.opacity(0.7)))
                      .padding(10)
              }
    }
}

#Preview {
    
    OvalTextView(text: "Data", borderWidth: 1.0)
//
    //OvalTextView(text: "Data")
}
