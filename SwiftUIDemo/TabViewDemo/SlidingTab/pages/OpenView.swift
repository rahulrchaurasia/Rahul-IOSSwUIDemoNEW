//
//  OpenView.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 02/01/24.
//

import SwiftUI

struct OpenView: View {
    var body: some View {
        
        ZStack{
            Color.red.opacity(0.6)
                .ignoresSafeArea()
            VStack(alignment: .leading,spacing: 10) {
               
                Text("Open View")
                    .font(.customfont(.bold, fontSize: 22))
                    .padding(20)
                    .background(Color.blue)
                    .clipShape(
                        RoundedRectangle(cornerRadius: 16)
            
                    )
                
                HStack{
                    
                    Image(systemName: "heart")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25,height: 25)
                    
                    Text("Open View Description")
                        .font(.customfont2(.medium, fontSize: 17))
                }
                Divider()
                
                Spacer()
                     
            }
            .padding()
            .frame( maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,  maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .topLeading)
        }
        
    }
}

struct CompletedView: View {
    var body: some View {
        
        ZStack{
            Color.yellow.opacity(0.6)
                .ignoresSafeArea()
            VStack(alignment: .leading,spacing: 10) {
               
                Text("Completed  View")
                    .font(.customfont(.bold, fontSize: 22))
                    .padding(20)
                    .background(Color.orange)
                    .clipShape(
                        RoundedRectangle(cornerRadius: 16)
            
                    )
                
                HStack{
                    
                    Image(systemName: "heart")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25,height: 25)
                    
                    Text("Complete View Description")
                        .font(.customfont2(.medium, fontSize: 17))
                }
                Divider()
                
                Spacer()
                     
            }
            .padding()
            .frame( maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,  maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .topLeading)
        }
        
    }
}

struct CancelledView: View {
    var body: some View {
        
        ZStack{
            Color.purple.opacity(0.6)
                .ignoresSafeArea()
            VStack(alignment: .leading,spacing: 10) {
               
                Text("Cancelled  View")
                    .font(.customfont(.bold, fontSize: 22))
                    .padding(20)
                    .background(Color.pink)
                    .clipShape(
                        RoundedRectangle(cornerRadius: 16)
            
                    )
                
                HStack{
                    
                    Image(systemName: "heart")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25,height: 25)
                    
                    Text("Cancelled View Description")
                        .font(.customfont2(.medium, fontSize: 17))
                }
                Divider()
                
                Spacer()
                     
            }
            .padding()
            .frame( maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,  maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .topLeading)
        }
        
    }
}

struct AllView: View {
    var body: some View {
        
        ZStack{
            Color.blue.opacity(0.6)
                .ignoresSafeArea()
            VStack(alignment: .trailing,spacing: 10) {
               
                Text("All  View")
                    .font(.customfont(.bold, fontSize: 22))
                    .padding(20)
                    .tint(.white)
                    .foregroundColor(.white)
                    .background(Color.black)
                    .clipShape(
                        RoundedRectangle(cornerRadius: 16)
            
                    )
                
                HStack{
                    
                    Image(systemName: "heart")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25,height: 25)
                    
                    Text("All View Description")
                        .font(.customfont2(.medium, fontSize: 17))
                }
                Divider()
                
                Spacer()
                     
            }
            .padding()
           
        }
      
        
    }
}

#Preview {
    //OpenView()
   // CompletedView()
    // CancelledView()
    AllView()
}
