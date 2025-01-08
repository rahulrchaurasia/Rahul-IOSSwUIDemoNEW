//
//  GeometryDemo2.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 22/12/23.
//

import SwiftUI

struct GeometryDemo2: View {
    var body: some View {
          ZStack {
              Color(.bg)
              GeometryReader { (geometry : GeometryProxy) in
                  VStack(spacing: 0){
                      
                        Rectangle()
                          .fill(Color.red)
                          .frame(width: geometry.size.width, height: geometry.size.height/4)
                      HStack(spacing: 0)
                          {
                              Rectangle()
                                  .fill(Color.blue)
                                  .frame(width: geometry.size.width/2, height: geometry.size.height/4,alignment: .center)
                              Rectangle()
                                  .fill(Color.green)
                                  .frame(width: geometry.size.width/2, height: geometry.size.height/4,alignment: .center)
                      }
                      HStack(spacing: 0)
                          {
                              Rectangle()
                                  .fill(Color.green)
                                  .frame(width: geometry.size.width/2, height: geometry.size.height/4,alignment: .center)
                              Rectangle()
                                  .fill(Color.blue)
                                  .frame(width: geometry.size.width/2, height: geometry.size.height/4,alignment: .center)
                      }
                      Rectangle()
                          .fill(Color.red)
                          .frame(width: geometry.size.width, height: geometry.size.height/9)
                      
                       
                      Text("Hello, World!")
                          .font(.largeTitle)
                            .position(x: geometry.size.width / 2, y: geometry.size.height / 4)
                       .rotationEffect(.degrees(90))

                                     
                  }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
              }
              .background(Color.orange)
          }
        
          
          
      }
}

#Preview {
    GeometryDemo2()
}
