//
//  CustomDemoView.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 13/06/23.
//

import SwiftUI

struct CustomDemoView: View {
    @State private var isLoading = false
    var body: some View {
        ZStack {
                  
                   VStack {
                       Button("Show Loader") {
                           isLoading = true
                           simulateNetworkRequest()
                       }
                   }
                   
                   CustomLoaderView(isLoading: $isLoading)
               }
    }
    
    // Simulate a network request
       func simulateNetworkRequest() {
           DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
               isLoading = false
           }
       }
}

struct CustomDemoView_Previews: PreviewProvider {
    static var previews: some View {
        CustomDemoView()
    }
}
