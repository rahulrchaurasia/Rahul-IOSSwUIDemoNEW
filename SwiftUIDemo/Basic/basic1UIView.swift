//
//  basic1UIView.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 28/02/23.
//

import SwiftUI

struct basic1UIView: View {
    var body: some View {
        ZStack{
           
            Color(.secondarySystemBackground)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack {
              
                
                NavigationLink {
                    ListView()
                } label: {
                    Text("ListView Demo")
                        .padding(12)
                        .font(.title2)
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .background(.red)
                        .cornerRadius(15)
                        
                }

                NavigationLink {
                    StickyMainView()
                } label: {
                    Text("StickyHeader Demo")
                        .padding(12)
                        .font(.title2)
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .background(.purple).opacity(0.9)
                        .cornerRadius(15)
                        
                }

                
               Spacer()
            }.padding(.top,10)
           
           
            
        }
    }
}

struct basic1UIView_Previews: PreviewProvider {
    static var previews: some View {
        basic1UIView()
    }
}
