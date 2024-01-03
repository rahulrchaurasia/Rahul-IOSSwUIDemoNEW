//
//  SimpleTabViewDemo.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 30/12/23.
//

import SwiftUI

struct SimpleTabViewDemo: View {
    
    @State var selectedTab = 0
    var body: some View {
       
        TabView(selection: $selectedTab,
                content:  {
            Text("Home View")
                .tabItem {
                   
                    Label("Home", systemImage: "house")
                }.tag(0)
            Text("Settings View").tabItem {
                Label("Settings", systemImage: "gear")
            }.tag(1)
        }
        
        ).overlay(alignment: .bottomTrailing) {
           
            Button(action: {
                
                print(" BUtton press")
                selectedTab = 1
               
            }, label: {
               
             Image(systemName: "plus")
                    .imageScale(.large)
                    .symbolRenderingMode(.hierarchical)
                    .foregroundColor(.white)

                    .padding()
                    .background(
                        
                        Circle()
                        .fill(Color.blue)
                        
                    )
                    .padding(10)
                     
                     
                
            }).offset(y: -50)
        }
      
    }
}

#Preview {
    SimpleTabViewDemo()
}
