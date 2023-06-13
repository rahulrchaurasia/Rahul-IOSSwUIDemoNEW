//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 25/02/23.
//

import SwiftUI

// Not in USED
struct ListDemoView: View {
    var body: some View {
        
        NavigationView{
            
            List(posts) { post in
                
                Text(post.name)
                
            }
            
            .navigationBarTitle("HX4News")
        }
        
    }
}

struct ListDemo_Previews: PreviewProvider {
    static var previews: some View {
        ListDemoView()
    }
}

struct Post: Identifiable  {
    
    let id : String
    let name : String
    
    
}

let posts = [
    
    Post(id: "1", name: "Hello"),
    Post(id: "2", name: "Bro"),
    Post(id: "3", name: "Technology"),
    Post(id: "4", name: "Determinatant")
]
