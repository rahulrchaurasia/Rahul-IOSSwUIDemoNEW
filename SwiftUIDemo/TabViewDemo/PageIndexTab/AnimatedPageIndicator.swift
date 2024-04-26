//
//  AnimatedPageIndicator.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 02/01/24.
//

import SwiftUI

struct AnimatedPageIndicator: View {
    
    // Colors as Tabs
    
   
    var colors : [Color]  = [.red,.yellow,.green,.blue]
    
    @State var offset: CGFloat =  0
    @State var currentIndex: Int = 0

     var body: some View {
               ScrollView(.init()) {
                   TabView(selection: $currentIndex) {
                       ForEach(colors.indices, id: \.self) { index in
                           colors[index]
                       }
                   }
                   .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                   .overlay(
                       HStack(spacing: 15) {
                           ForEach(colors.indices, id: \.self) { index in

                               
       Circle()
                                   .fill(Color.white)
                                   .frame(width: 7, height: 7)
                                   .opacity(getIndex == index ? 1 : 0.5)
                           }
                       }
                       .frame(maxWidth: .infinity) // Ensure HStack fills available space
                       .overlay(
                           Capsule()
                               .fill(Color.white)
                               .frame(width: 20, height: 7)
                               .offset(x: getOffset)
                               .animation(.easeInOut(duration: 0.3), value: offset)
                       , alignment: .leading)
                       .padding(.bottom, 10)
                       .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0)
                   , alignment: .bottom)
                   .onChange(of: currentIndex) { newValue in
                       DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { // Delay animation slightly
                           withAnimation {
                               offset = -CGFloat(newValue) * getWidth
                           }
                       }
                   }
               }
           }

      
        
    var getIndex: Int {
            Int(round(Double(offset / getWidth)))
       }

    var getOffset: CGFloat {
        (1 - offset / getWidth) * 22 // Invert offset for correct bidirectional movement
      }
    
    
}

#Preview {
    AnimatedPageIndicator()
}
