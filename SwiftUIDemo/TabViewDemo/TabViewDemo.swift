//
//  TabViewDemo.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 27/07/23.
//

import SwiftUI

/*   For Handling Tabbar when Open on Child Screen
//Note :   UITabBar.appearance().barTintColor = .white

 */
struct TabViewDemo: View {
    
    @State private var selection = 0
    var body: some View {
        
        ZStack(alignment: .topTrailing) {
            TabView(selection: $selection) {
                List(1...10, id: \.self) { index in
                    NavigationLink(
                        destination: Text("Item #\(index) Details"),
                        label: {
                            Text("Item #\(index)")
                                .font(.system(size: 20, weight: .bold, design: .rounded))
                        })
                    
                }.padding(.top)
               
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .tag(0)
                
                Text("Bookmark Tab")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .tabItem {
                        Image(systemName: "bookmark.circle.fill")
                        Text("Bookmark")
                    }
                    .tag(1)
                
                Text("Video Tab")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .tabItem {
                        Image(systemName: "video.circle.fill")
                        Text("Video")
                    }
                    .tag(2)
                
                Text("Profile Tab")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .tabItem {
                        Image(systemName: "person.crop.circle")
                        Text("Profile")
                    }
                    .tag(3)
            }
            
            Button(action: {
                selection = (selection + 1) % 4
                
                print(" selection ", selection)
            }) {
                Text("Next")
                    .font(.system(.headline, design: .rounded))
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.red)
                    .cornerRadius(10.0)
                    .padding()
         
            }.offset(y : -20)
        }
        
        .accentColor(.red)
        .onAppear() {
            UITabBar.appearance().barTintColor = .white
        }
       
        
        .navigationTitle("TabView Demo")
    }
}

struct TabViewDemo_Previews: PreviewProvider {
    static var previews: some View {
        TabViewDemo()
    }
}
