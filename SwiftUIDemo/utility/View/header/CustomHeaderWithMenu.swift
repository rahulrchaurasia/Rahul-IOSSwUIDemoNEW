//
//  CustomHeaderWithMenu.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 24/04/24.
//

import SwiftUI

struct CustomHeaderWithMenu: View {
    let title: String // Property to hold the title text
    let dismissAction:(() -> Void)? // Optional closure for dismiss button action

    let menuAction:(() -> Void)?
    let homeAction:(() -> Void)?

    var body: some View {
        HStack(alignment: .center) {
            // First Check Optional using if let
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
            
            if let menuAction = menuAction {
                Button(action: menuAction) {
                    Image(systemName: "square.and.arrow.up.fill")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.white)
                        .frame(width: 20, height: 20)
                }
            }
            
            if let homeAction = homeAction {
                Button(action: homeAction) {
                    Image(systemName: "house")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.white)
                        .frame(width: 20, height: 20)
                        .padding(.leading, 8)
                        .padding(.trailing,12)
                }
            }
            
            
           
            
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
        CustomHeaderWithMenu(title: "Preview Title", dismissAction: {
            
        },menuAction: {}, homeAction : {}
        
        ) // No dismiss action provided
                Spacer()
    }
            .background(Color.bg)
}
