//
//  MenuLink.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 24/03/25.
//

import SwiftUI

struct MenuLink: View {
    let icon: String
        let title: String
        
    var body: some View {
           HStack(spacing: 20) {
               Image(systemName: icon)
                   .frame(width: 30, height: 30)
                   .foregroundColor(.white)
               Text(title)
                   .font(.headline)
                   .foregroundColor(.white)
               Spacer()
           }
           .padding(.vertical, 10)
       }
}

#Preview {
    MenuLink(icon: "house",title: "Home")
            .background(Color.blue)
            .padding()
}
