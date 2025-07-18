//
//  SlideMenuUsingUIKIT.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 24/03/25.
//

import SwiftUI



struct SlideMenuUsingUIKIT: View {
    var body: some View {
        SlideMenuContainer {
            // Main Content
            NavigationView {
                List(1..<20) { i in
                    Text("Item \(i)")
                }
                .navigationTitle("Main Content")
            }
        } menuContent: {
            // Menu Content
            VStack(alignment: .leading, spacing: 20) {
                Text("Menu")
                    .font(.largeTitle)
                    .padding(.top, 50)
                    .padding(.leading, 20)
                
                Button(action: {}) {
                    HStack {
                        Image(systemName: "house")
                        Text("Home")
                    }
                    .foregroundColor(.white)
                    .padding()
                }
                
                Button(action: {}) {
                    HStack {
                        Image(systemName: "gear")
                        Text("Settings")
                    }
                    .foregroundColor(.white)
                    .padding()
                }
                
                Spacer()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.blue)
        }
    }
}

#Preview {
    SlideMenuUsingUIKIT()
}
