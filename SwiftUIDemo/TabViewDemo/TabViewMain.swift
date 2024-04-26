//
//  TabViewMain.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 29/12/23.
//

import SwiftUI

struct TabViewMain: View {
    var body: some View {
        VStack{
            
            NavigationLink {
                TabViewDemo()
            } label: {
                Text("Bottom Tab Demo1")
                    .padding(12)
                    .font(.title2)
                    .foregroundColor(.white)
                    .background(.red)
                    .cornerRadius(15)
                    
            }
            
           
            NavigationLink(destination:  SimpleTabViewDemo()) {
                Text("Simple TabView Demo ")
                    .padding(12)
                    .font(.title2)
                    .foregroundColor(.white)
                    .background(.orange.opacity(0.7))
                    .cornerRadius(15)
            }
            
            NavigationLink(destination:    PagingIndexViewTab()) {
                Text("Paging IndexView Tab")
                    .padding(12)
                    .font(.title2)
                    .foregroundColor(.white)
                    .background(.pink.opacity(0.7))
                    .cornerRadius(15)
            }
          
            NavigationLink(destination:    AnimatedPageIndicator()) {
                Text("Animated Page Indicator Demo")
                    .padding(12)
                    .font(.title2)
                    .foregroundColor(.white)
                    .background(.blue.opacity(0.7))
                    .cornerRadius(15)
            }
            
            NavigationLink(destination:    CustomSlidingTab()) {
                Text("Custom Sliding Demo")
                    .padding(12)
                    .font(.title2)
                    .foregroundColor(.white)
                    .background(.primary.opacity(0.7))
                    .cornerRadius(15)
            }
//            
//            NavigationLink(destination:    StickyMainView()) {
//                Text("List Sticky View Demo")
//                    .padding(12)
//                    .font(.title2)
//                    .foregroundColor(.white)
//                    .background(.black.opacity(0.7))
//                    .cornerRadius(15)
//            }
//            //ListComplexDemo
//            //StickyMainView
//            Spacer()

        }
    }
}

#Preview {
    TabViewMain()
}
