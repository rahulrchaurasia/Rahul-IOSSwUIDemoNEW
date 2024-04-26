//
//  HeaderTestView.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 30/12/23.
//

import SwiftUI

struct HeaderTestView: View {
   
   // @ObservedObject var homeData: HomeViewModel
    var offset: CGFloat = 220
    var selectedTab = tabsItems.first!.tab
      @Environment(\.colorScheme) var scheme
    var didClose : (()->())?
    var body: some View {
           VStack(alignment: .leading, spacing: 10) {

               HStack(spacing: 0) {
                   Button(action: {
                       
                       didClose?()
                   }, label: {
                       Image(systemName: "arrow.left")
                           .font(.system(size: 20, weight: .bold))
                           .frame(width: size, height: size)
                           .foregroundColor(.black)
                   })

                   Text("Kavsoft Backery")
                       .font(.title)
                       .fontWeight(.bold)
               }

               ZStack {
                   VStack(alignment: .leading, spacing: 10, content: {
                       Text("Asiatisch . Koreanisch . Japnisch")
                           .font(.caption)

                       HStack(spacing: 8) {
                           Image(systemName: "clock")
                               .font(.caption)

                           Text("30-40 Mins")
                               .font(.caption)

                           Text("4.3")
                               .font(.caption)

                           Image(systemName: "star.fill")
                               .font(.caption)

                           Text("$6.40 Fee")
                               .font(.caption)
                               .padding(.leading, 10)
                       }
                       .frame(maxWidth: .infinity, alignment: .leading)
                   })
                   .opacity(offset > 200 ? 1 - Double((offset - 200) / 50) : 1)

                   
               }
               // Default frame 60
               // Top frame = 40
               // So total = 100
               .frame(height: 60)

               if offset > 250 {
                   Divider()
               }

           }
           .padding(.horizontal)
           .frame(height: 100)
           .background(scheme == .dark ? Color.black : Color.white)
       }

    
    var size: CGFloat {
           if offset > 200 {
               let progress = (offset - 200) / 50
               if progress <= 1.0 {
                   return progress * 40
               } else {
                   return 40
               }
           } else {
               return 0
           }
       }
}


struct HeaderTestView_Previews: PreviewProvider {
    static var previews: some View {
       
        return HeaderTestView()
            .previewLayout(.sizeThatFits) // Adapt to preview size
                        .padding() // Add padding for clarity
            //.environmentObject(homeData)
    }
     
}
