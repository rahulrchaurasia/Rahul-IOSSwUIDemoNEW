//
//  NavigateBuilder.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 15/06/23.
//

import Foundation
import SwiftUI

struct CustomNavigationBar<Content: View>: View {
    let title: String
    let action: () -> Void
    let content: Content
    
    init(title: String, action: @escaping () -> Void, @ViewBuilder content: () -> Content) {
        self.title = title
        self.action = action
        self.content = content()
    }
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    action()
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.blue)
                }
                
                Text(title)
                    
                    .font(.headline)
                    .foregroundColor(.blue)
                    .padding(.leading, 10)
                Spacer()
                
               
            }
            .padding()
            .background(Color.white)
            .shadow(color: Color.gray.opacity(0.3), radius: 2, x: 0, y: 2)
            
            content
           // Spacer()
        }
    }
}

struct CustomNavigationBar2<Content: View>: View {
    let title: String
    let action: () -> Void
    let content: Content
    
    init(title: String, action: @escaping () -> Void, @ViewBuilder content: () -> Content) {
        self.title = title
        self.action = action
        self.content = content()
    }
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    action()
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.blue)
                }
                
                Text(title)
                    
                    .font(.headline)
                    .foregroundColor(.blue)
                    .padding(.leading, 10)
                Spacer()
                Button(action: {
                    action()
                }) {
                    Image(systemName: "chevron.right")
                        .foregroundColor(.blue)
                }
               
            }
            .padding()
            .background(Color.white)
            .shadow(color: Color.gray.opacity(0.3), radius: 2, x: 0, y: 2)
            
            content
           // Spacer()
        }
    }
}
