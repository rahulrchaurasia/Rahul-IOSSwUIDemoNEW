//
//  GeometryParrallexEffect.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 10/01/25.
//

import SwiftUI



struct GeometryParrallexEffect: View {
    var body: some View {
        ScrollView {
            VStack {
                // Parallax Header
                GeometryReader { geometry in
                    Image("a2")
                        .resizable()
                        .scaledToFill()
                        .offset(y: -geometry.frame(in: .global).minY / 2) // Parallax effect
                        .frame(
                            width: geometry.size.width,
                            height: max(0, geometry.size.height + geometry.frame(in: .global).minY) // Prevent negative height
                        )

                }
                .frame(height: 300) // Fixed header height
                
                // Content
                VStack(spacing: 20) {
                    ForEach(1...20, id: \.self) { index in
                        Text("Item \(index)")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue.opacity(0.2))
                            .cornerRadius(10)
                    }
                }
                .padding()
            }
        }
        .edgesIgnoringSafeArea(.top) // Makes the header stretch to the screen's top
    }
}

#Preview {
    GeometryParrallexEffect()
}
