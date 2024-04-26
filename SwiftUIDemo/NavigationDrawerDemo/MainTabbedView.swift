//
//  MainTabbedView.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 02/01/24.
//

import SwiftUI
/*
//https://medium.com/geekculture/side-menu-in-ios-swiftui-9fe1b69fc487

//https://github.com/muhammadabbas001/SideMenuSwiftUI?source=post_page-----9fe1b69fc487--------------------------------
 */
struct MainTabbedView: View {
    @State var presentSideMenu = false
      @State var selectedSideMenuTab = 1
    var body: some View {
        ZStack{
                  
                  TabView(selection: $selectedSideMenuTab) {
                      NavigationHomeView(presentSideMenu: $presentSideMenu)
                          .tag(0)
                      FavoriteView(presentSideMenu: $presentSideMenu)
                          .tag(1)
                      ChatView(presentSideMenu: $presentSideMenu)
                          .tag(2)
                      ProfileView(presentSideMenu: $presentSideMenu)
                          .tag(3)
                  }
                  SideMenu(isShowing: $presentSideMenu, content: AnyView(SideMenuView(selectedSideMenuTab: $selectedSideMenuTab, presentSideMenu: $presentSideMenu)))
              }
    }
}

#Preview {
    MainTabbedView()
}
