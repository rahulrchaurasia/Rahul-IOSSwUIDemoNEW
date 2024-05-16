//
//  RectangleBorderView.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 13/05/24.
//

import SwiftUI

struct RectangleBorderView: View {
    
    var strText : String = ""
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0){
            //ZStack{
                
                
                Text(strText)
                    .font(.customfont(.medium, fontSize: 18))
                    .foregroundStyle(Color.primaryApp)
                
                    .frame(width: 70, height: 44, alignment: .center)
                
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.primaryApp, lineWidth: 1)
                    }
               
                
           // }
        }
        
        .frame(width: 70, height: 44,alignment: .leading)
      
       
    }
}

#Preview {
    RectangleBorderView(strText: "+10")
}
