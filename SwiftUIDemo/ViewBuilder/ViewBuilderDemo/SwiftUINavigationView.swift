//
//  SwiftUINavigationView.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 15/06/23.
//

import SwiftUI

struct SwiftUINavigationView: View {
    
    var body: some View {
        NavigationView{
            
            CustomNavigationBar2(title: "Demo1") {
                print("Data")
            } content: {
                Text("Hello, World!")
                       .padding()
            }
            
            
            
            
            Spacer()

           

        }
        
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

struct SwiftUINavigationView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUINavigationView()
    }
}


struct SwiftUINavigationView1: View {
    
    var body: some View {
        VStack {
                   HStack {
                       Button(action: {
                           //action()
                       }) {
                           Image(systemName: "chevron.left")
                               .foregroundColor(.blue)
                               .font(.title)
                       }
                       
                       Text("title")
                           .font(.headline)
                           .foregroundColor(.blue)
                           .padding(.leading, 10)
                       
                       
                       Spacer()
                   }
                   
                   .padding()
                   .background(Color.white)
                   .shadow(color: Color.gray.opacity(0.3), radius: 2, x: 0, y: 2)
                   
                   //content
               }
    }
}
