//
//  SlideMenuCustom1.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 18/01/24.
//

import SwiftUI

struct SlideMenuCustom1: View {
    
    @State private var isMenuOpen = false
      @State private var menuDragOffset: CGFloat = 0
    var body: some View {
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    // Menu
                    MenuView1(width: geometry.size.width / 2)
                        .offset(x: isMenuOpen ? 0 : -geometry.size.width / 2 + menuDragOffset)
                        .opacity(isMenuOpen ? 1 : 0)
                        .animation(.easeInOut, value: isMenuOpen)

                    // Main content
                    MainContentView()
                        .background(Color.white)
                        .cornerRadius(isMenuOpen ? 20 : 0)
                        .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 5)
                        .offset(x: menuDragOffset)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    let offset = value.translation.width
                                    menuDragOffset = offset
                                    if offset > 0 {
                                        isMenuOpen = true
                                    }
                                }
                                .onEnded { value in
                                    let offset = value.translation.width
                                    if offset > geometry.size.width / 3 {
                                        isMenuOpen = true
                                    } else {
                                        isMenuOpen = false
                                    }
                                    menuDragOffset = 0
                                }
                        )
                    .overlay(
                        Button(action: {
                            withAnimation {
                                isMenuOpen.toggle()
                            }
                        }, label: {
                            Image(systemName: "line.horizontal.3")
                                .frame(width: 44, height: 44)
                                .padding()
                                .foregroundColor(.black)
                                .background(Color.white.opacity(0.8))
                                .clipShape(Circle())
                                .shadow(radius: 5)
                                .padding(.top, 40)
                                .padding(.leading, 20)
                        })
                    )
                }
            }
            .ignoresSafeArea(.all, edges: .leading)
        }
}

#Preview {
    SlideMenuCustom1()
}
