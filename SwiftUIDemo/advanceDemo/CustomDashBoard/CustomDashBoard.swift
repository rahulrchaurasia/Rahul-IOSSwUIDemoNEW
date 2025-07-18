//
//  CustomDashBoard.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 09/05/24.
//

import SwiftUI

struct CustomDashBoard: View {
    
    @StateObject var hVM = CustomDashBoardViewModel.shared
    @State private var isOpen = false
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        ZStack{
            
            VStack{
                
                HStack(spacing: 0){
                    
                    Spacer()
                        .frame(width: 60, alignment: .center)
                    
                    Spacer()
                    
                    HStack{
                        Text("$")
                            .font(.customfont(.bold, fontSize: 14))
                            .foregroundColor(Color.secondaryApp)
                        
                        Text("157.57")
                            .font(.customfont(.bold, fontSize: 25))
                            .foregroundColor(Color.primaryText)
                    }
                    
                    .frame(width: 140, alignment: .center)
                    .padding(8)
                    .background(Color.white)
                    
                    .cornerRadius(35)
                    .shadow(radius: 3, x:0, y:-1)
                    .onTapGesture {
                        dismiss()
                    }
                    
                    Spacer()
                    
                    
                    NavigationLink {
                        MenuView()
                    } label: {
                        ZStack(alignment: .bottomLeading) {
                            
                            Image("u1")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                            
                                .overlay(RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.gray, lineWidth: 1.5 ))
                                .cornerRadius(20)
                                .clipped()
                            
                            Text("3")
                                .font(.customfont(.regular, fontSize: 10))
                                .foregroundColor(Color.white)
                                .padding(.horizontal, 5)
                                .background(Color.red)
                                .cornerRadius(20)
                                .overlay( RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.white, lineWidth: 1.5 ))
                        }
                        .frame(width: 60)
                    }

                   
                    
                    
                    
                }
                .padding(.horizontal , 15)
                .padding(.top, .topInsets )
                
                Spacer()
                
                
                HStack {
                    
                    Spacer()
                        .frame(width: 50)
                    
                    Spacer()
                    
                    Button {
                        hVM.actionGoOnline()
                    } label: {
                        ZStack{
                            Text( "GO")
                                .font(.customfont(.semibold, fontSize: 22))
                                .foregroundColor(Color.white)
                        }
                        .frame(width: 60, height: 60, alignment: .center)
                        .overlay( 
                            RoundedRectangle(cornerRadius: 30)
                            .stroke(Color.white, lineWidth: 1.5 )
                        )
                        .cornerRadius(60)
                    }
                    .frame(width: 70, height: 70, alignment: .center)
                    .background( hVM.isOnline ? Color.redApp : Color.primaryApp)
                    .cornerRadius(35)

                    
                    Spacer()
                    
                    Button(action: {
                        
                    }, label: {
                        Image("current_location")
                            .resizable()
                            .frame(width: 50, height: 50)
                        
                    })
                    
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 10)
                
                VStack(){
                    HStack{
                        
                        Button(action: {
                            withAnimation {
                                isOpen.toggle()
                            }
                            
                        }, label: {
                            
                            Image( !isOpen ? "open_btn" : "close_btn")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15)
                        })
                        
                        Spacer()
                        
                        Text("You're \( hVM.isOnline ? "online" : "offline" )")
                            .font(.customfont(.bold, fontSize: 18))
                            .foregroundColor(Color.primaryText)
                        Spacer()
                        Spacer()
                            .frame(width: 15)
                    }
                    .padding(.horizontal, 25)
                    .frame(height: 50)  // define bottom Dialog Height
                    .padding(.bottom, isOpen ? 0 : .bottomInsets)
                    
                    if(isOpen) {
                        VStack(spacing: 0){
                            Divider()
                            
                            HStack(spacing: 0){
                                
                                IconTitleSubtitleButton(icon: "acceptance", title: "Acceptance", subtitle: "95.0%")
                                
                                Divider()
                                    .frame(height: 100)
                                IconTitleSubtitleButton(icon: "rate", title: "Rating", subtitle: "4.75")
                                
                                Divider()
                                    .frame(height: 100)
                                Group {
                                    IconTitleSubtitleButton(icon: "cancelleation", title: "Cancelleation", subtitle: "2.0%")
                                }
                            }
                            Divider()
                                .padding(.bottom, !isOpen ? 0 : .bottomInsets)
                        }
                    }
                    
                    
                        
                }
                .background(Color.white)
                .cornerRadius(20, corner: [.topLeft, .topRight])
                .shadow(radius: 3, x:0, y:-3)
                
            }
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden()
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    CustomDashBoard()
}
