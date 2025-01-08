//
//  GeometryDemo1.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 22/12/23.
//


import SwiftUI


//SwiftUI GeometryReader Responsiveness
//https://www.rootstrap.com/blog/how-to-use-geometryreader-in-swiftui
/*
 For example, let's say you have a view that contains a series of buttons. You want the buttons to be evenly spaced across the screen, regardless of the screen size or orientation.
 */
struct GeometryDemo1: View {
    var body: some View {
        
        ZStack{
            Color.gray10
                .ignoresSafeArea()
            VStack(spacing:10){
                    GeometryReader { geometry in
                        VStack(spacing: 10) {
                          Text("GeometryReader")
                            .font(.title)
                          Text("Buttons example")
                            .font(.subheadline)
                          
                            HStack(alignment:.center) {
                            Button("Button 1") {}
                                    .foregroundStyle(.white)
                                  .frame(width: geometry.size.width * 0.4, height: 50)
                              .background(.orange)
                            Button("Button 2") {}
                                  .frame(width: geometry.size.width * 0.25, height: 50)
                              .background(.yellow)
                            Button("Button 3") {}
                              .frame(width: geometry.size.width * 0.25, height: 50)
                              .background(.green)
                               // Adjust as needed
                            }
                           
                        }
                      

                      }
               
                .padding(.horizontal,10)
                
                GeometryReader { geometry in
                     VStack {
                       Spacer()
                       ZStack {
                         Rectangle()
                           .foregroundColor(.blue)
                         Circle()
                           .foregroundColor(.white)
                           .frame(
                             width: geometry.size.width * 0.5,
                             height: geometry.size.width * 0.5
                           )
                       }
                       Spacer()
                     }
                   }
    
            }
            
          
        }
        
        
    }
}

#Preview {
    GeometryDemo1()
}
