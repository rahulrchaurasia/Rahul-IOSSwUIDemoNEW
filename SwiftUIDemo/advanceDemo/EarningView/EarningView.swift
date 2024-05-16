//
//  EarningView.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 11/05/24.
//

import SwiftUI

struct EarningView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State var isToday = false
    
    var body: some View {
        ZStack{
            VStack{

                ZStack{
                    Text("Earning")
                        .font(.customfont(.extraBold, fontSize: 25))
                    
                    HStack{
                        
                        Button(action: {
                            
                            dismiss()
                        }, label: {
                          
                            Image("back")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30,height: 30,alignment: .leading)
                        })
                        
                        Spacer()
                        
                        Button(action: {
                            
                            dismiss()
                        }, label: {
                          
                            Text("NORMAL")
                                .font(.customfont(.regular, fontSize: 16))
                                .foregroundStyle(Color.primaryApp)
                            
                        })
                        
                       
                        
                    }
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .center)
                    
                    
                  
                }
                .padding(.horizontal,20)
                .padding(.top ,.topInsets)
              
               // Spacer()
                
                VStack(spacing: 0){
                    
                    VStack(alignment: isToday ? .leading : .trailing){
                        
                        HStack {
                            
                            Button(action: {
                                
                                withAnimation {
                                    
                                    isToday = true
                                }
                                
                            }, label: {
                                
                                Text("TODAY")
                                    .font(.customfont(.extraBold, fontSize: 16))
                                
                                    .foregroundStyle(isToday ? Color.primaryApp : Color.lightGray )
                            })
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .center)
                            
                            
    
                            Button(action: {
                                
                                withAnimation {
                                    
                                    isToday = false
                                }
                                
                            }, label: {
                                
                                Text("WEEKLY")
                                    .font(.customfont(.extraBold, fontSize: 16))
                                
                                    .foregroundStyle(!isToday ? Color.primaryApp : Color.lightGray )
                            })
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .center)
                        }
                        .frame(height: 40)
                        //.background(Color.red)
                        
                        
                        RoundedRectangle(cornerRadius: 2)
                            .fill(Color.primaryApp)
                            .frame(width: .screenWidth * 0.5 - 25 , height: 4 )
                    }
                    .padding(.horizontal,25)
                    
                    Rectangle()
                        .fill(Color.lightWhite)
                        .frame( height: 8)
                        .padding(.bottom,10)
                    
                }
                
                
                ScrollView{
                    
                    VStack(spacing :0){
                        
                        VStack {
                            
                            Text(isToday ?"Mon, 18 OCT'23" : "Weekly, 21 OCT'23")
                                .font(.customfont(.regular, fontSize: 16))
                                .foregroundStyle(Color.secondaryText)
                                .padding(.top,25)
                            
                            if(isToday){
                                HStack(alignment: .center,spacing: 8){
                                    
                                    Text("$")
                                        .foregroundStyle(Color.primaryApp)
                                        .font(.customfont(.extraBold, fontSize: 14))
                                    
                                    
                                    Text("154.75")
                                        .font(.customfont(.extraBold, fontSize: 25))
                                        .foregroundStyle(Color.primaryText)
                                    
                                    
                                }
                                .padding(.bottom, 25)
                            }else{
                                HStack(alignment: .center,spacing: 8){
                                    
                                    Text("$")
                                        .foregroundStyle(Color.primaryApp)
                                        .font(.customfont(.extraBold, fontSize: 14))
                                    
                                    
                                    Text("2694.57")
                                        .font(.customfont(.extraBold, fontSize: 25))
                                        .foregroundStyle(Color.primaryText)
                                    
                                    
                                }
                                .padding(.bottom, 25)
                            }
                         
                           
                            
                            
                            if(!isToday){
                                
                                //Graph
                               // GeometryReader { geometry in
                                    HStack{
                                        
                                        VStack{
                                            
                                            Spacer()
                                            
                                            Rectangle()
                                                .fill(Color.primaryApp)
                                                .frame(width: 40, height: 120)
                                                .cornerRadius(10, corner: [.topLeft, .topRight])
                                            
                                            Text("M")
                                                .font(.customfont(.regular, fontSize: 16))
                                            
                                        }
                                        
                                        VStack{
                                            
                                            Spacer()
                                            
                                            Rectangle()
                                                .fill(Color.primaryApp)
                                                .frame(width: 40, height: 80)
                                                .cornerRadius(10, corner: .allCorners)
                                            
                                            Text("T")
                                                .font(.customfont(.regular, fontSize: 16))
                                        }
                                        
                                        VStack {
                                            Spacer()
                                            Rectangle()
                                                .fill(Color.primaryApp)
                                                .frame( width: 40, height: 60)
                                                .cornerRadius(10, corner: [.topLeft, .topRight])
                                            
                                            Text("W")
                                                .font(.customfont(.regular, fontSize: 16))
                                                .foregroundColor(Color.secondaryText)
                                        }
                                        
                                        VStack {
                                            Spacer()
                                            Rectangle()
                                                .fill(Color.primaryApp)
                                                .frame( width: 40, height: 90)
                                                .cornerRadius(10, corner: [.topLeft, .topRight])
                                            
                                            Text("T")
                                                .font(.customfont(.regular, fontSize: 16))
                                                .foregroundColor(Color.secondaryText)
                                        }
                                        
                                        VStack {
                                            Spacer()
                                            Rectangle()
                                                .fill(Color.primaryApp)
                                                .frame( width: 40, height: 120)
                                                .cornerRadius(10, corner: [.topLeft, .topRight])
                                            
                                            Text("F")
                                                .font(.customfont(.regular, fontSize: 16))
                                                .foregroundColor(Color.secondaryText)
                                        }
                                        
                                        VStack {
                                            Spacer()
                                            Rectangle()
                                                .fill(Color.primaryApp)
                                                .frame( width: 40, height: 20)
                                                .cornerRadius(10, corner: [.topLeft, .topRight])
                                            
                                            Text("S")
                                                .font(.customfont(.regular, fontSize: 16))
                                                .foregroundColor(Color.secondaryText)
                                        }
                                        
                                        VStack {
                                            Spacer()
                                            Rectangle()
                                                .fill(Color.primaryApp)
                                                .frame( width: 40, height: 80)
                                                .cornerRadius(10, corner: [.topLeft, .topRight])
                                            
                                            Text("S")
                                                .font(.customfont(.regular, fontSize: 16))
                                                .foregroundColor(Color.secondaryText)
                                        }
                                    }
//                                    .frame(width: geometry.size.width, height: geometry.size.width * 0.4, alignment: .bottom)
                                    
 
                                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .bottom)
                                    .frame(height: getWidth * 0.4)
                                
                                    
                               // }
                            }
                          
                            
                            VStack(spacing : 0){
                               
                                Divider()
                                   
                                
                                HStack {
                                    
                                    TitleSubtitleButton(title: "15", subtitle: "Trips")
                                    
                                    Rectangle().fill(Color.lightGray)
                                        .frame(width: 1, height: 80)
                                    
                                    
                                    TitleSubtitleButton(title: "8:30", subtitle: "Online hrs")
                                    
                                    Rectangle().fill(Color.lightGray)
                                        .frame(width: 1, height: 80)
                                    
                                    TitleSubtitleButton(title: "$22.48", subtitle: "Cash Tip")
                                  
                                }
                                
                                Divider()
                                
                                Rectangle()
                                    .fill(Color.lightGray)
                                    .frame(height: 8)
                                
                            
                            }
                            
                            
                            
                        }
                        
                        VStack {
                            
                            TitleSubtitleRow(title: "Trip Fares", subtitle: "$40.25",color: Color.secondaryText)
                                .padding(.top,10)
                            
                            TitleSubtitleRow(title: "Taxi Fee", subtitle: "$20.00", color: .secondaryText)
                            TitleSubtitleRow(title: "+ Tax", subtitle: "$400.00", color: .secondaryText)
                            TitleSubtitleRow(title: "+ Tolls", subtitle: "$400.25", color: .secondaryText)
                            TitleSubtitleRow(title: "Surge", subtitle: "$40.25", color: .secondaryText)
                            TitleSubtitleRow(title: "Discount(-)", subtitle: "$20.75", color: .secondaryText)
                                .padding(.bottom,8)
                            
                            
                            Divider()
                                .padding(.horizontal,20)
                            
                            TitleSubtitleRow(title: "Total Earning", subtitle: "$860.75", color: Color.primaryApp, fontWeight: .extraBold)
                            
                        
                        }
                      
                    }
                   
                }
                
                 Spacer()
            }
            .padding(.bottom,.bottomInsets)
        }
        
        .navigationTitle("")
        .navigationBarBackButtonHidden()
        .navigationBarHidden(true)
        .ignoresSafeArea()
      
    }
}

#Preview {
    EarningView()
}
