//
//  MenuView.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 18/01/24.
//

import SwiftUI

struct MenuView1: View {
    
    let width: CGFloat

    var body: some View {
        VStack(alignment: .leading,spacing: 25){
           
            HStack(alignment: .center, spacing: 15){
                
               Image(systemName: "house.fill")
                    .imageScale(.large)
                
                Text("Home")
                    .font(.title2)
                    
            }
            HStack(alignment: .center, spacing: 15){
                
               Image(systemName: "person.fill.badge.plus")
                    .imageScale(.large)
                
                Text("Profile")
                    .font(.title2)
            }
            HStack(alignment: .center, spacing: 15){
                
               Image(systemName: "bell.fill")
                    .imageScale(.large)
                
                Text("Notification")
                    .font(.title2)
            }
            HStack(alignment: .center, spacing: 15){
                
               Image(systemName: "gearshape.fill")
                    .imageScale(.large)
                
                Text("Setting")
                    .font(.title2)
            }
              
          Spacer()
        }
        .padding() // Add padding around content
               .frame(width: width)
               .frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        // Adjust width as needed
               .background(Color(.systemGray6)) // Apply a background color
       
    }
}

#Preview {
    MenuView1(width: 200)
}
