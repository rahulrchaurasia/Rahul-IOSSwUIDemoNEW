//
//  DrawerHeaderView.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 18/01/24.
//

import SwiftUI

struct DrawerHeaderView: View {
    var body: some View {
            VStack(alignment: .leading) {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.blue)
                    .padding(.bottom, 8)

                Text("User Name")
                    .font(.headline)
                    .foregroundColor(.black)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.blue)
        }
}

#Preview {
    DrawerHeaderView()
}
