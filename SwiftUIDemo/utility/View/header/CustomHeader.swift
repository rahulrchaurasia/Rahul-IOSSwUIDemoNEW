//
//  CustomHeader.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 22/04/24.
//

import SwiftUI

struct CustomHeader: View {
    let title: String // Property to hold the title text
    let dismissAction:(() -> Void)? // Optional closure for dismiss button action


    var body: some View {
        HStack(alignment: .center) {
                    if let dismissAction = dismissAction { // Show back button if dismissAction is provided
                        Button(action: dismissAction) {
                           
                            Image(systemName: "arrow.backward")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(.white)
                               
                                .frame(width: 20, height: 20)
                                .contentShape(Rectangle())
                        }
                        .padding(.leading,8)
                        .padding(.trailing,20)
                    }
                    Text(title)
                        .font(.title2)
                        .foregroundColor(.white)
                    Spacer() // Pushes content to the left
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.all, 10)
                .background(
                    Color.toolBar
                )
                .shadow(color: Color.toolBar.opacity(0.7), radius: 2, x: 3, y: 5)

    }
}

#Preview {
    
    VStack {
        CustomHeader(title: "Preview Title", dismissAction: {
            
             }) // No dismiss action provided
                Spacer()
            }
            .background(Color.bg)
}
