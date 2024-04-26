//
//  ListDemoMenu.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 21/07/23.
//

import SwiftUI

struct ListDemoMenu: View {
    var body: some View {
        
        VStack{
            
            NavigationLink {
                ListDemoMain()
            } label: {
                Text("Basic List with MultiLine Text")
                    .padding(12)
                    .font(.title2)
                    .foregroundColor(.white)
                    .background(.red)
                    .cornerRadius(15)
                    
            }
            
            NavigationLink(destination:  FilterListDemo()) {
                Text("Filter List")
                    .padding(12)
                    .font(.title2)
                    .foregroundColor(.white)
                    .background(.purple.opacity(0.7))
                    .cornerRadius(15)
            }
            NavigationLink(destination:  ScrollViewReaderDemo()) {
                Text("ScrollViewReaderDemo List")
                    .padding(12)
                    .font(.title2)
                    .foregroundColor(.white)
                    .background(.orange.opacity(0.7))
                    .cornerRadius(15)
            }
            
            NavigationLink(destination:    ListSection()) {
                Text("ListSection Demo")
                    .padding(12)
                    .font(.title2)
                    .foregroundColor(.white)
                    .background(.pink.opacity(0.7))
                    .cornerRadius(15)
            }
          
            NavigationLink(destination:    PinnedViewList()) {
                Text("Listwith Pinned View Demo")
                    .padding(12)
                    .font(.title2)
                    .foregroundColor(.white)
                    .background(.blue.opacity(0.7))
                    .cornerRadius(15)
            }
            
            NavigationLink(destination:    ListComplexDemo()) {
                Text("List Complex Demo")
                    .padding(12)
                    .font(.title2)
                    .foregroundColor(.white)
                    .background(.blue.opacity(0.7))
                    .cornerRadius(15)
            }
            
            NavigationLink(destination:    StickyMainView()) {
                Text("List Sticky View Demo")
                    .padding(12)
                    .font(.title2)
                    .foregroundColor(.white)
                    .background(.black.opacity(0.7))
                    .cornerRadius(15)
            }
            //ListComplexDemo
            //StickyMainView
            
            NavigationLink(destination:     ListParallexDemo()
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
            )
            {
                Text("List Parallex Demo")
                    .padding(15)
                    .font(.title2)
                    .foregroundColor(.white)
                    .background(.mint.opacity(0.7))
                    .cornerRadius(15)
            }
           
            NavigationLink(destination: NestedListDemo()
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
            )
            {
                Text("Nested List Demo")
                    .padding(15)
                    .font(.title2)
                    .foregroundColor(.white)
                    .background(.cyan.opacity(0.7))
                    .cornerRadius(15)
            }
            
            NavigationLink(destination: Nested2ListDemo()
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
            )
            {
                Text("Nested List custom Demo")
                    .padding(15)
                    .font(.title2)
                    .foregroundColor(.white)
                    .background(.brown.opacity(0.7))
                    .cornerRadius(15)
            }
            //Nested2ListDemo
            //NestedListDemo
            Spacer()
        }
      
      

    }
}

struct ListDemoMenu_Previews: PreviewProvider {
    static var previews: some View {
        ListDemoMenu()
    }
}
