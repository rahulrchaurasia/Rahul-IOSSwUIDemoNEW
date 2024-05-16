//
//  WalletRow.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 12/05/24.
//

import SwiftUI

struct WalletRow: View {
    
    @State var wObj: NSDictionary = [:]
    
    var body: some View {
        VStack{
            
            HStack(spacing :15){
                
                Image(wObj.value(forKey: "icon") as?  String ?? "")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40,height: 40)
                   
                
                VStack(alignment: .leading, spacing : 8){
                        
                        Text(wObj.value(forKey: "name") as? String ?? "")
                            .font(.customfont(.regular, fontSize: 16))
                            .foregroundStyle(Color.primaryText)
                        
                    Text(wObj.value(forKey: "time") as? String ?? "")
                        .font(.customfont(.regular, fontSize: 15))
                        .foregroundStyle(Color.secondaryText)
                    
                    
                    
                }
                .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                .frame(maxWidth: .infinity,alignment: .leading)
                
                Text(wObj.value(forKey: "price") as? String ?? "")
                    .font(.customfont(.regular, fontSize: 15))
                    .foregroundStyle(Color.primaryText)
                    .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                  
                
            }
         
            Divider()
        }
    }
}

#Preview {
    
    WalletRow(wObj: [
        "icon": "wallet_add",
        "name": "Added to Wallet",
        "time": "1 Feb'19 • #123467",
        "price": "$40"
      ])
   
}
