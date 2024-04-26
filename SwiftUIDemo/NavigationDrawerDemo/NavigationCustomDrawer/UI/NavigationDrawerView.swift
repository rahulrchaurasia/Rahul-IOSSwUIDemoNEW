//
//  NavigationDrawerView.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 18/01/24.
//

import SwiftUI

struct NavigationDrawerView: View {
    
    @Binding var isDrawerOpen: Bool
    var body: some View {
            VStack(alignment: .leading) {
                // Drawer Header
                DrawerHeaderView()

                // Menu Items
                List {
                    NavigationLink(destination: Text("Home")) {
                        DrawerMenuItemView(icon: "house.fill", title: "Home")
                    }

                    NavigationLink(destination: Text("Profile")) {
                        DrawerMenuItemView(icon: "person.fill", title: "Profile")
                    }

                    NavigationLink(destination: Text("Products")) {
                        DrawerMenuItemView(icon: "bag.fill", title: "Products")
                    }
                }
                .listStyle(SidebarListStyle()) // For a compact sidebar style

                // Logout Button
                Button(action: {
                    // Handle logout
                }) {
                    DrawerMenuItemView(icon: "arrow.backward.circle.fill", title: "Logout")
                }
                .foregroundColor(.red)
                .padding(.top, 10)
                .padding(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .background(Color.white)
            .frame(width: 300) // Adjust the drawer width as needed
            .gesture(DragGesture().onChanged { value in
                if value.translation.width > 0 {
                    isDrawerOpen = true
                } else {
                    isDrawerOpen = false
                }
            })
        }
}

#Preview {
    NavigationDrawerView(isDrawerOpen: .constant(true))
}
