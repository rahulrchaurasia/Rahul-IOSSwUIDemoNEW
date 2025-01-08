//
//  GeometryDemo4.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 07/01/25.
//

import SwiftUI

struct GeometryDemo4: View {
    var body: some View {
           
        VStack {
                    Rectangle()
                        .fill(Color.teal)
                        .frame(height: 200) // Push GeometryReader downward
                    
                    GeometryReader { proxy in
                        ZStack {
                            Color.orange.opacity(0.3) // Background to visualize GeometryReader
                            
                            Text("Where I am (Local) Frame \(proxy.frame(in: .local).debugDescription)")
                                    .position(x: proxy.frame(in: .local).midX,
                                              y: proxy.frame(in: .local).midY)
                                    .foregroundColor(.blue)
                               
                            
                            
                            Text("Where I am (Global) Frame: \(proxy.frame(in: .global).debugDescription)")
                                .position(x: proxy.frame(in: .global).midX,
                                          y: proxy.frame(in: .global).midY)
                                .foregroundColor(.red)
                        }
                    }
                }
                .coordinateSpace(name: "VSTACK")
                .navigationTitle("Geometry Reader")
            }
        
}

#Preview {
    GeometryDemo4()
}
