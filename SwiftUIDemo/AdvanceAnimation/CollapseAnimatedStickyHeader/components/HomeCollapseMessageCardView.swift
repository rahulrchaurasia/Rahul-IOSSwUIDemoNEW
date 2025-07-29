//
//  HomeCollapseTopMessageView.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 28/07/25.
//

import SwiftUI

struct HomeCollapseMessageCardView: View {
    
    var message : Message
    
    var body: some View {
        
        HStack (spacing: 15){
            
            Circle()
                .fill(Color.blue)
                .frame(width: 30, height: 30)
            
            VStack(alignment: .leading, spacing: 8){
                
                Text(message.username)
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text(message.message)
            }
            .foregroundStyle(Color.primaryText)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    HomeCollapseMessageCardView(message: Message.sample)
}
