//
//  DemoScrollSectionItem.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 22/08/25.
//

import SwiftUI

struct DemoScrollSectionItem: View {
    let tab: DemoTab   // input passed from parent
    
    var body: some View {
            VStack(spacing: 16) {
                Text("Section \(tab.rawValue)")
                    .font(.title)
                    .fontWeight(.bold)

                ForEach(1...5, id: \.self) { i in
                    Text("Item \(i) in \(tab.rawValue)")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(8)
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(12)
            .shadow(radius: 2)
        }
}

#Preview {
    
    DemoScrollSectionItem(tab: .five)
}
