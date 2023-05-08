//
//  StickyHeaderView.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 03/04/23.
//

import SwiftUI

struct StickyHeaderView: View {
    var body: some View {
      
        
        VStack(alignment: .leading, spacing: 6){
            
            //back Button Action
            
            HStack(spacing: 0){
                
                Button {
                    print("Data...")
                } label: {
                    Image(systemName: "arrow.left")
                        .font(.system(size: 20,weight: .bold))
                        .frame(width: 40, height: 40)
                        .foregroundColor(.primary)
                }
                
                Text("Online Backery!!")
                    .font(.title)
                    .fontWeight(.bold)
            }.padding(.leading, -20)
            
           
            
            Text("Indian . Japanisch . Asiatich")
                .font(.caption)
            
            HStack( spacing: 8){
                
                Image(systemName: "clock")
                    .font(.caption)
                Text("30-40Min")
                    .font(.caption)
                Text("4.3")
                    .font(.caption)
                Image(systemName: "star.fill")
                    .font(.caption)
                Text("10% Discount")
                    .font(.caption)
                    .padding(.leading,10)
                
            }
            .frame( maxWidth: .infinity, alignment: .leading)
        }
         .padding(.horizontal )
        .frame(height: 80)
        .background(Color.white) //Note : we use background color bec Header i.e stickyheader is over / above the list. if we not used bg color than at scroll header bg is transparent
        
    }
}

struct StickyHeaderView_Previews: PreviewProvider {
    static var previews: some View {
       // StickyHeaderView()
        StickyMainView()
    }
}
