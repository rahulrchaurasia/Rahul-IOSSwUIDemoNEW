//
//  WalletView.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 12/05/24.
//

import SwiftUI

struct WalletView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State var listArr = [
        
        [
          "icon": "wallet_add",
          "name": "Added to Wallet",
          "time": "1 Feb'19 • #123467",
          "price": "$40"
        ],
        [
          "icon": "trips_cut",
          "name": "Trip Deducted",
          "time": "1 Feb'19 • #123467",
          "price": "$40"
        ],
        [
          "icon": "withdraw",
          "name": "Withdraw to Wallet",
          "time": "1 Feb'19 • #123467",
          "price": "$40"
        ],
            [
          "icon": "wallet_add",
          "name": "Added to Wallet",
          "time": "1 Feb'19 • #123467",
          "price": "$40"
        ],
        [
          "icon": "trips_cut",
          "name": "Trip Deducted",
          "time": "1 Feb'19 • #123467",
          "price": "$40"
        ],
        [
          "icon": "withdraw",
          "name": "Withdraw to Wallet",
          "time": "1 Feb'19 • #123467",
          "price": "$40"
        ],
        [
          "icon": "wallet_add",
          "name": "Added to Wallet",
          "time": "1 Feb'19 • #123467",
          "price": "$40"
        ],
        [
          "icon": "trips_cut",
          "name": "Trip Deducted",
          "time": "1 Feb'19 • #123467",
          "price": "$40"
        ],
        [
          "icon": "withdraw",
          "name": "Withdraw to Wallet",
          "time": "1 Feb'19 • #123467",
          "price": "$40"
        ]
    
    ]
    var body: some View {
        ZStack{
            
            VStack(spacing : 0){
                
                ZStack{
                    
                    Text("Wallet")
                        .font(.customfont(.extraBold, fontSize: 25))
                        .foregroundStyle(Color.primaryText)
                    
                    HStack{
                        
                        Button {
                           dismiss()
                        } label: {
                            Image("back")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                        }

                       
                        
                        Spacer()
                        
                    }
                }
                .padding(.horizontal,20)
                .padding(.bottom,10)
                .padding(.top,.topInsets)
               
                
                Divider()
                    
                Rectangle()
                    .fill(Color.lightWhite)
                    .frame(height: 8)
                    
                
               
                ScrollView(showsIndicators: false){
                        
                        VStack(spacing :0){
                            
                            VStack {
                                Text("Total Balance")
                                    .font(.customfont(.regular, fontSize: 16))
                                    .foregroundStyle(Color.secondaryText)
                                
                                HStack(alignment: .top, spacing: 8){
                                    
                                    Text("$")
                                        .font(.customfont(.extraBold, fontSize: 14))
                                        .foregroundStyle(Color.primaryApp)
                                    
                                    Text("156.75")
                                        .font(.customfont(.extraBold, fontSize: 25))
                                        .foregroundStyle(Color.primaryText)
                                }
                            }
                            .padding(.top,25)
                            .padding(.bottom, 25)
                            
                            Divider()
                            
                            VStack(spacing :0){
                                HStack{
                                    
                                    Text("WITHDRAW")
                                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .center)
                                        .foregroundStyle(Color.primaryApp)
                                        .font(.customfont(.bold, fontSize: 14))
                                    
                                    Rectangle()
                                        .fill(Color.lightGray)
                                    
                                        .frame(width: 1,height: 50)
                                    
                                    
                                    Text("ADD MONEY")
                                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .center)
                                        .foregroundStyle(Color.primaryApp)
                                        .font(.customfont(.bold, fontSize: 14))
                                }
                                
                                
                                Divider()
                                
                                Rectangle()
                                    .fill(Color.lightWhite)
                                    .frame(height: 20)
                                
                                
                                Text("May 2024")
                                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                                    .foregroundStyle(Color.primaryText)
                                    .font(.customfont(.extraBold, fontSize: 15))
                                    .padding(.horizontal,20)
                                    .padding(.bottom, 8)
                                    .background(
                                        Color.lightWhite
                                    )
                            }
                            
                            
                            LazyVStack{
                                
                                ForEach(0...listArr.count - 1, id:\.self){ index in
                                    
                                    
                                    WalletRow(wObj: listArr[index] as NSDictionary ?? [:])
                                    
                                }
                            }
                            .padding(.horizontal,20)
                            
                            
                        }
                    }
                  
                
                  Spacer()
                
            }
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden()
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    WalletView()
}
