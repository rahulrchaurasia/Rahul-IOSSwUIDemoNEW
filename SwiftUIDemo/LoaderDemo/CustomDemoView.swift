//
//  CustomDemoView.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 13/06/23.
//

import SwiftUI

struct CustomDemoView: View {
    @State private var isLoading = false
    @State private var count = 0
    var body: some View {
        ZStack {
            
            VStack {
                Spacer()
                
                
                Button {
                    count += 1
                    isLoading = true
                    simulateNetworkRequest()
                } label: {
                    ZStack{
                        
                        Text("Show Loader")
                            .font(.title2)
                            .padding(40)
                            .background(Color.gray.opacity(0.4))
                            .cornerRadius(10)
                        
                        Text("\(count)")
                            
                            .circularText()
                            .frame(width: 40, height: 40)
                            .offset(x: 90,y: 40)
                    }
                    
                    
                    
                    
                }
                
                Spacer()
                
                Text("\(count)")
                    .font(.title)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                Spacer()
                
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
