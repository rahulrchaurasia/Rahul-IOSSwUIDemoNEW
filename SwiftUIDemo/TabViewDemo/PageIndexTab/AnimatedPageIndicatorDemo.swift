//
//  AnimatedPageIndicatorDemo.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 03/01/24.
//

import SwiftUI

struct AnimatedPageIndicatorDemo: View {
    
    var colors : [Color]  = [.red,.yellow,.green,.blue]
    
    var body: some View {
        VStack{
            //paging View
            ScrollView(.horizontal) {
                
                LazyHStack(spacing :0 ){
                  
                    ForEach(colors, id: \.self){ color in
                        
                        RoundedRectangle(cornerRadius: 25)
                            .fill(color)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                }
            }
          
           
        }
     
    }
}

#Preview {
    AnimatedPageIndicatorDemo()
}
