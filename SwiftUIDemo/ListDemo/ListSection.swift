//
//  ListSection.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 19/07/23.
//

import SwiftUI

struct ListSection: View {
    init(){
         Theme.navigationBarColors(background: .purple, titleColor: .white)
      }
    var body: some View {
        List {
                Section(header: Text("Header")) {
                    Text("Row 1")
                    Text("Row 2")
                    Text("Row 3")
                }
                
                Section(header: Text("Another Header 2")) {
                    Text("Row 4")
                    Text("Row 5")
                    Text("Row 6")
                }
            Section(header: Text("Another Header 3")) {
                Text("Row 4")
                Text("Row 5")
                Text("Row 6")
            }
            Section(header: Text("Another Header 4")) {
                Text("Row 4")
                Text("Row 5")
                Text("Row 6")
            }
            Section(header: Text("Another Header 5")) {
                Text("Row 4")
                Text("Row 5")
                Text("Row 6")
            }
            }
    }
}

struct ListSection_Previews: PreviewProvider {
    static var previews: some View {
        ListSection()
    }
}
