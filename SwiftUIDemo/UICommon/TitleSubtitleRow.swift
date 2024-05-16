//
//  TitleSubtitleRow.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 11/05/24.
//

import SwiftUI

struct TitleSubtitleRow: View {
    
    var title: String = "Title"
    var subtitle: String = "Subtitle"
    var color: Color = .primaryText
    var fontWeight: NunitoSans = .regular
    
    var body: some View {
        
        HStack{
            
            Text(title)
                .font(.customfont(fontWeight, fontSize: 15))
                .foregroundStyle(color)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
            
            Text(subtitle)
                .font(.customfont(fontWeight, fontSize: 15))
                .foregroundStyle(color)
        }
        .padding(.horizontal,20)
        .padding(.vertical,2)
        
    }
}

#Preview {
    TitleSubtitleRow()
}
