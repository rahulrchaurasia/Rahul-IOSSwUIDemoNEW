//
//  ListRowView.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 28/03/23.
//

import SwiftUI

struct ListRowView: View {
    
    let item : ItemModel
    
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ? "checkmark.circle"
                  :"circle" )
            .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }.font(.title2)
            .padding(.vertical,8 )
    }
}


struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        let item1 = ItemModel(title: "First item", isCompleted: true)
        ListRowView(item: item1)
    }
}
