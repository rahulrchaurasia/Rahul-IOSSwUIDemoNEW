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
            
            NavigationLink(destination:  SlidingTabDemo()) {
                Text("Slider Tab Demo2")
                    .padding(12)
                    .font(.title2)
                    .foregroundColor(.white)
                    .background(.purple.opacity(0.7))
                    .cornerRadius(15)
            }
//            NavigationLink(destination:  ScrollViewReaderDemo()) {
//                Text("ScrollViewReaderDemo List")
//                    .padding(12)
//                    .font(.title2)
//                    .foregroundColor(.white)
//                    .background(.orange.opacity(0.7))
//                    .cornerRadius(15)
//            }
//            
//            NavigationLink(destination:    ListSection()) {
//                Text("ListSection Demo")
//                    .padding(12)
//                    .font(.title2)
//                    .foregroundColor(.white)
//                    .background(.pink.opacity(0.7))
//                    .cornerRadius(15)
//            }
//          
//            NavigationLink(destination:    PinnedViewList()) {
//                Text("Listwith Pinned View Demo")
//                    .padding(12)
//                    .font(.title2)
//                    .foregroundColor(.white)
//                    .background(.blue.opacity(0.7))
//                    .cornerRadius(15)
//            }
//            
//            NavigationLink(destination:    ListComplexDemo()) {
//                Text("List Complex Demo")
//                    .padding(12)
//                    .font(.title2)
//                    .foregroundColor(.white)
//                    .background(.blue.opacity(0.7))
//                    .cornerRadius(15)
//            }
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
