//
//  PrimaryTextView.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 14/06/23.
//
/*
 
 In this example, the PrimaryTextView is a custom container view that accepts a closure with @ViewBuilder. Inside the closure, we can pass multiple child views, including conditional views. The PrimaryTextView then applies additional modifications to the child views, such as padding, background color, and corner radius.

 In the ContentView, we use the PrimaryTextView and conditionally include a secondary text view based on the showSecondaryText flag. The @ViewBuilder closure allows us to construct the view hierarchy dynamically based on this condition.

 By using @ViewBuilder, you can create flexible and reusable views that can accept and modify multiple child views based on specific requirements or conditions.
 */

import Foundation
import SwiftUI


struct PrimaryTextView<Content: View>: View {
    let content: () -> Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        VStack {
            content()
                .padding()
                .background(Color.yellow)
                .cornerRadius(10)
        }
        .padding()
    }
}


struct CustomContainerView<Content: View>: View {
    let content: () -> Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Custom Container View")
                .font(.title)
                .foregroundColor(.black)
            
            content()
        }
        .padding()
        .background(Color.yellow.opacity(0.2))
        .cornerRadius(10)
    }
}

struct HeaderViewGeneric<Content: View>: View {
   
    let title : String
    let content: () -> Content  // diff 1
    
    init(title: String,@ViewBuilder content: @escaping ()-> Content) {
        self.title = title
        self.content = content   // this  diff 2
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.largeTitle)
                .foregroundColor(.black)
            
            content()// diff 3
           
            Divider()
        }.frame(maxWidth: .infinity)
            .foregroundColor(Color("skyblue"))
            .padding(.horizontal)
      
    }
}


