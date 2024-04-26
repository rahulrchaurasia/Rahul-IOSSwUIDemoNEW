//
//  ChatView.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 02/01/24.
//

import SwiftUI

struct ChatView: View {
    
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
            Text("Chat View")
            Spacer()
        }
        .padding(.horizontal, 24)
    }
}

#Preview {
    ChatView(presentSideMenu: .constant(false))
}



