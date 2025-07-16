//
//  SlideMenuView.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 24/03/25.
//

import SwiftUI


struct SlideMenuView: View {
        @State private var showMenu = false
        @State private var offset: CGFloat = 0
        
        var body: some View {
            ZStack {
                // Main content
                VStack {
                    // Top navigation bar with hamburger menu
                    HStack {
                        Button(action: {
                            withAnimation {
                                self.showMenu.toggle()
                            }
                        }) {
                            Image(systemName: "line.horizontal.3")
                                .font(.title)
                                .foregroundColor(.black)
                        }
                        Spacer()
                        Text("Main Screen")
                            .font(.title)
                        Spacer()
                    }
                    .padding()
                    .background(Color.white)
                    
                    Spacer()
                    Text("Main Content")
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.white)
                .offset(x: showMenu ? UIScreen.main.bounds.width * 0.6 : 0)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            if value.translation.width > 0 {
                                self.offset = value.translation.width
                                // Only open menu if not already open
                                if !showMenu {
                                    showMenu = self.offset > 80
                                }
                            }
                        }
                        .onEnded { value in
                            withAnimation {
                                // Check if should show or hide menu based on drag distance
                                if value.translation.width > UIScreen.main.bounds.width * 0.3 {
                                    self.showMenu = true
                                } else {
                                    self.showMenu = false
                                }
                                self.offset = 0
                            }
                        }
                )
                
                // Slide menu (positioned at left)
                if showMenu {
                    SlideMenuCellView(showMenu: $showMenu)
                        .frame(width: UIScreen.main.bounds.width * 0.6)
                        .transition(.move(edge: .leading))
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
    
    
    

#Preview {
    SlideMenuView()
}
