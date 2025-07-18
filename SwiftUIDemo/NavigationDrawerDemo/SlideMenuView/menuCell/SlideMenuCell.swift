//
//  SlideMenuView.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 24/03/25.
//

import SwiftUI

struct SlideMenuCell: View {
    @Binding var showMenu: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 20) {
                Button(action: {
                    withAnimation {
                        self.showMenu = false
                    }
                }) {
                    Image(systemName: "xmark")
                        .font(.title)
                        .foregroundColor(.white)
                }
                .padding(.top)
                
                // Menu items
                MenuLink(icon: "house", title: "Home")
                MenuLink(icon: "person", title: "Profile")
                MenuLink(icon: "gear", title: "Settings")
                MenuLink(icon: "info.circle", title: "About")
            }
            .padding(.horizontal)
            .padding(.top, 50)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.blue) // Your blue rectangle
        .edgesIgnoringSafeArea(.all)
        .offset(x: 0) // Always positioned at the left side
    }
}


#Preview("Slide Menu") {
    SlideMenuCell(showMenu: .constant(true))
        .frame(width: UIScreen.main.bounds.width * 0.6)
        .background(Color.blue)
}
