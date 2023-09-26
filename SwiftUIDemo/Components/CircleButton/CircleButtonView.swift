//
//  CircleButtonView.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 21/07/23.
//

import SwiftUI

struct CircleButtonView: View {
    
    let iconName : String
    var body: some View {
       Image(systemName: iconName)
            .font(.headline)
            .foregroundColor(Color.black.opacity(0.8))
            .frame(width: 50, height: 50)
            .background(
            
                Circle()
                    .foregroundColor(Color.gray.opacity(0.4))
            )
            .shadow(color: Color.accentColor.opacity(0.7), radius: 25, x: 0, y: 0)
    }
}

struct CircleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CircleButtonView(iconName: "info")
            .previewLayout(.sizeThatFits)
    }
}
