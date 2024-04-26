//
//  MainPageNavDrawerHome.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 18/01/24.
//

import SwiftUI

struct MainPageNavDrawerHome: View {
    
    @State private var isDrawerOpen = false
    var body: some View {
            NavigationView {
                ZStack {
                    // Main content
                    Color.blue.edgesIgnoringSafeArea(.all)

                    // Navigation Drawer
                    //NavigationDrawerView(isDrawerOpen: $isDrawerOpen)
                   //     .offset(x: isDrawerOpen ? 0 : -300) // Adjust the drawer width as needed

                    // Hamburger Menu Button
                    Button(action: {
                        withAnimation {
                            isDrawerOpen.toggle()
                        }
                    }) {
                        Image(systemName: "line.horizontal.3")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding()
                    }
                    .offset(x: 16, y: 16) // Adjust the offset as needed

                }
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
            }
        }
}

#Preview {
    MainPageNavDrawerHome()
}
