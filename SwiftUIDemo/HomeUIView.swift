//
//  HomeUIView.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 26/05/23.
//

import SwiftUI

struct HomeUIView: View {
    var body: some View {
        ZStack{
           
            Color(.secondarySystemBackground)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack {
              
                
                NavigationLink {
                    stickyHeaderUIView()
                } label: {
                    Text("List Basic & Advance Demo")
                        .padding(12)
                        .font(.title2)
                        .foregroundColor(.white)
//                        .fontWeight(.semibold)
                        .background(.red)
                        .cornerRadius(15)
                        
                }

                NavigationLink {
                    TextFieldDemo()
                } label: {
                    Text("TextField Demo")
                        .padding(12)
                        .font(.title2)
                        .foregroundColor(.white)
//                        .fontWeight(.semibold)
                        .background(.purple).opacity(0.9)
                        .cornerRadius(15)
                        
                }

                
               Spacer()
            }.padding(.top,10)
           
           
            
        }
    }
}

struct HomeUIView_Previews: PreviewProvider {
    static var previews: some View {
        HomeUIView()
    }
}
