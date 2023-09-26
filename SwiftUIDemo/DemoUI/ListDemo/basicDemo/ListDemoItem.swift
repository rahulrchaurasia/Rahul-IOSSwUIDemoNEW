//
//  ListDemoItem.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 21/07/23.
//

import SwiftUI

struct ListDemoItem: View {
    var item: ListMainModel
    var body: some View {
       
        HStack(alignment: .center, spacing: 10)
        {
            
            Image("citrus")
                .resizable()
                .scaledToFit()
                .background(Color("skyblue"))
                .frame(width: 150, height: 150, alignment: .leading)
                .clipShape(RoundedRectangle(cornerRadius: 20 ,style: .continuous))
            
            VStack(alignment: .leading, spacing: 8){
                
                Text(item.name)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .opacity(0.8)
                
                Text(item.data)
                    .font(.title2)
                    .fontWeight(.semibold)
                   // .fixedSize(horizontal: false, vertical: true) // Set vertical fixed size
                    .lineLimit(3)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.leading)
                Text(item.subData)
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.leading)
            }
        }
        .frame( maxWidth: .infinity,  alignment: .leading)
        .padding()
        
    }
}

struct ListDemoItem_Previews: PreviewProvider {
    static var previews: some View {
        let item = ListMainModel(id: 1, name: "demo", data: "daya", subData: "sub")
        ListDemoItem(item: item)
    }
}
