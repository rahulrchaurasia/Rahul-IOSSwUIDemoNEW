//
//  CircularProgressView.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 13/06/23.
//

import SwiftUI

struct CircularProgressView: View {
    @Binding var progress: Double
    var body: some View {
        ZStack {
                   Circle()
                       .stroke(lineWidth: 10)
                       .opacity(0.3)
                       .foregroundColor(.gray)
                   
                   Circle()
                       .trim(from: 0, to: CGFloat(min(progress, 1.0)))
                       .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                       .foregroundColor(.blue)
                       .rotationEffect(.degrees(-90))
                       .animation(.linear)
                   
                   Text(String(format: "%.0f%%", min(progress, 1.0) * 100.0))
                       .font(.title)
                       .fontWeight(.bold)
               }
               .padding()
           }
    }


struct CircularProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProgressView(progress: .constant(22))
    }
}
