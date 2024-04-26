//
//  DrawerMenuItemView.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 18/01/24.
//

import SwiftUI

struct DrawerMenuItemView: View {
    var icon: String
        var title: String

        var body: some View {
            HStack {
                Image(systemName: icon)
                    .frame(width: 25, height: 25)
                    .foregroundColor(.blue)

                Text(title)
                    .foregroundColor(.black)
                    .padding(.leading, 8)

                Spacer()
            }
            .padding()
        }
}

#Preview {
    DrawerMenuItemView(icon: "person.fill", title: "Profile")
}
