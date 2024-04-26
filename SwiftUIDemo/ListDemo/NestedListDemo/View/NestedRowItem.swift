//
//  NestedRowItem.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 01/01/24.
//

import SwiftUI

struct NestedRowItem: View {
    
    let subData : subItem
    var body: some View {
       
        VStack(spacing: 0){
            Text(subData.subtitle)
               
                .font(.customfont(.semibold, fontSize: 20))
                .foregroundColor(.black)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                .padding(.horizontal)
               
            Divider()
                .background(Color.red.opacity(0.5))
                .padding([.top,.bottom])
        }
       
       
       
       // .background(Color.gray.opacity(0.1))
       // .customTextViewModifier(roundedCornes: 10, textColor: .white)
    }
}



struct NestedRowItem_Previews: PreviewProvider {
    static var previews: some View {
        let subData = subItem(subtitle: "SubTitle")
        NestedRowItem(subData: subData)
    }
}
