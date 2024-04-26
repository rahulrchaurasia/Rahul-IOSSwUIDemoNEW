//
//  PagingIndexViewTab.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 02/01/24.
//

import SwiftUI

struct PagingIndexViewTab: View {
    @State var selectedPage = 0
    var body: some View {
       
        
        TabView(selection: $selectedPage)
        {
           
            formattedText("Page#1", backgroundColor: .indigo, foregroundColor: .white)
                .tag(0)
            
            formattedText("Page#2", backgroundColor: .pink, foregroundColor: .white)
                .tag(1)
            
            formattedText("Page#3", backgroundColor: .mint, foregroundColor: .white)
                .tag(2)
            
            formattedText("Page#4", backgroundColor: .yellow, foregroundColor: .white)
                .tag(3)
            
            formattedText("Page#5", backgroundColor: .cyan, foregroundColor: .white)
                .tag(4)
        }

        .tabViewStyle(.page(indexDisplayMode: .always))
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        
        
    }
    

}

#Preview {
    PagingIndexViewTab()
}
