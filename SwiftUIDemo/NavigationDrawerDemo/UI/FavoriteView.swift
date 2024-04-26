//
//  FavoriteView.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 03/01/24.
//

import SwiftUI

struct FavoriteView: View {
    
    @Binding var presentSideMenu: Bool
    
    var body: some View {
        VStack{
            HStack{
                Button{
                    presentSideMenu.toggle()
                } label: {
                    Image("menu")
                        .resizable()
                        .frame(width: 32, height: 32)
                }
                Spacer()
            }
            
            Spacer()
            Text("Favorite View")
            Spacer()
        }
        .padding(.horizontal, 24)
    }
}

//#Preview {
//    FavoriteView()
//}


#Preview {
    FavoriteView(presentSideMenu: .constant(false))
}
