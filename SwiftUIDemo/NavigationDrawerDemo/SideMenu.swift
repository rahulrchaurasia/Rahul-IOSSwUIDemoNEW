//
//  SideMenu.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 02/01/24.
//

import SwiftUI

struct SideMenu: View {
    
    @Binding var isShowing: Bool
     var content: AnyView
     var edgeTransition: AnyTransition = .move(edge: .leading)
    var body: some View {
        ZStack(alignment: .bottom) {
                    if (isShowing) {
                        Color.black
                            .opacity(0.3)
                            .ignoresSafeArea()
                            .onTapGesture {
                                isShowing.toggle()
                            }
                        content
                            .transition(edgeTransition)
                            .background(
                                Color.clear
                            )
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                .ignoresSafeArea()
                .animation(.easeInOut, value: isShowing)
    }
}

//#Preview {
//    SideMenu()
//}
struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {

        
        SideMenu(isShowing: .constant(true), content: AnyView(Text("Sample Content")))
                   
            //.previewLayout(.fixed(width: 500, height: 800))
    }
}
