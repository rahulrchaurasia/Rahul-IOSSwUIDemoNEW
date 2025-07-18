//
//  IconTitleSubtitleButton.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 09/05/24.
//

import SwiftUI

struct IconTitleSubtitleButton: View {
    var icon: String = "acceptance"
    var title: String = "Title"
    var subtitle: String = "Subtitle"
    
    var body: some View {
        VStack{
            Image(icon)
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20, alignment: .center)
            
            Text(title)
                .font(.customfont(.bold, fontSize: 18))
                .foregroundColor(Color.primaryText)
            
            Text(subtitle)
                .font(.customfont(.regular, fontSize: 16))
                .foregroundColor(Color.secondaryText)
        }
        .frame(maxWidth: .infinity,
               alignment: .center)
    }
}

#Preview {
    IconTitleSubtitleButton()
   
}
