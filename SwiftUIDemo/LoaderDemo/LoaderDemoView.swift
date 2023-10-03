//
//  LoaderDemoView.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 13/06/23.
//

import SwiftUI

struct LoaderDemoView: View {
    
    @State private var isLoading = false
    var body: some View {
      
        ZStack {
                  VStack {
                      Button("Show HUD") {
                          isLoading = true
                          simulateNetworkRequest()
                      }
                      
                     
                  }
                  
                  if isLoading {
                      Color.black.opacity(0.4)
                          .edgesIgnoringSafeArea(.all)
                          .overlay(
                              VStack {
                                  ProgressView()
                                      .progressViewStyle(CircularProgressViewStyle(tint: .white))
                                  
                                  Text("Loading...")
                                      .foregroundColor(.white)
                                      .padding(.top, 8)
                              }
                              .padding(16)
                              .background(Color.gray)
                              .cornerRadius(8)
                          )
                  }
              }
    }
    
    // Simulate a network request
        func simulateNetworkRequest() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                isLoading = false
            }
        }
}

struct LoaderDemoView_Previews: PreviewProvider {
    static var previews: some View {
        LoaderDemoView()
    }
}
