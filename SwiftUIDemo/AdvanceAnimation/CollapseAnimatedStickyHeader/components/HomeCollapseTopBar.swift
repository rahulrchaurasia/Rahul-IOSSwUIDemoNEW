//
//  HomeCollapseTopBar.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 28/07/25.
//


import SwiftUI

struct HomeCollapseTopBar: View {
    
    var topEdge : CGFloat
    @Binding var offset : CGFloat
    var maxHeight : CGFloat
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            
            Image("choclate")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 80)
                .cornerRadius(10)
            
            Text("Shopping")
                .font(.largeTitle)
                .bold()
            

            Text("Creamy Choclate truffle Cake, best chocolate cake in town")
                .fontWeight(.semibold )
                .foregroundStyle(.white).opacity(0.8)
            
            
            
        }
        .padding()
        .padding(.bottom)
        .opacity(getOpacity())
       
    }
    
    func getOpacity() -> CGFloat {
       
        let progress = -offset/90
        
        let opacity = 1 - progress
        
        return offset < 0 ? opacity :  1
    }
}

#Preview {
    //HomeCollapseHeaderView()
    var offset : CGFloat = 50
    HomeCollapseTopBar(topEdge: 50, offset: .constant(offset), maxHeight: 80)
}
