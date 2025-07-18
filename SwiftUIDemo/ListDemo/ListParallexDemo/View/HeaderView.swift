//
//  HeaderView.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 30/12/23.
//
/****************************************************
//Note :
 .opacity(homeData.offset > 200 ?
          ( 1 - Double(
          (homeData.offset - 200) / 50))
          :
          1)
 Our List parallexList head ImageView height is 250
 hence maximum ofset will be 250
 1> Initial stage
 a>Since opacity here using ternary operator if offset greater than 200 than
 text opacity decrease slightly till 0 and when less than 200 than full ie 1
 b>its mean when parallexList head ImageView  full hence height 250 at that time we have full offset ie offset = 250
 
 2> So when we start scrolling up direction offset become increase suppose here initial value 59 ...to 250 above..
 
a> start time offset = 59.0
  so in ternarry operator
 
 //   offset > 200 ? "Do Operation" : 1
  hence else statement execute and opacity here -1
  and our headerView show fully
 
 b> when Slightly go up but more than 200 let offset = 220
 
 .opacity(250 > 200 ?
           operation....   // true
          :
          1)
 
 hence ( 1 - Double(
        (220 - 200) / 50))
         = 0.6
 so opacity faded 0.6 % percentage
c>
 scroll at top time than  offset = 250
 
 .opacity(250 > 200 ?
           operation....   // true
          :
          1)
 hence ( 1 - Double(
        (homeData.offset - 200) / 50))
   ie 1- (250-200)/50
       1 - 1 = 0
 
 headerView hide fully
******************************************************/
import SwiftUI

// height : of HeaderView is fixed ie 100
struct HeaderView: View {
    
    @EnvironmentObject var homeData: HomeViewModel
    
      @Environment(\.colorScheme) var scheme
    
   // @State var calData : Double
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
                 
//                   .opacity(homeData.offset > 200 ? 1 - Double((homeData.offset - 200) / 50) : 1)
                   .opacity(homeData.offset > 200 ? 
                            ( 1 - Double(
                            (homeData.offset - 200) / 50))
                            :
                            1)
                   

                   // Custom ScrollView
                   // For Automatic scrolling
                   ScrollViewReader { reader in
                       ScrollView(.horizontal, showsIndicators: false, content: {
                           HStack(spacing: 0) {
                               ForEach(tabsItems) { tab in
                                   Text(tab.tab)
                                       .font(.caption)
                                       .padding(.vertical, 10)
                                       .padding(.horizontal)
                                       .background(
                                           Color.primary
                                               .opacity(homeData.selectedTab == tab.tab ? 1 : 0)
                                       )
                                       .clipShape(Capsule())
                                       .foregroundColor(
                                        homeData.selectedTab == tab.tab ? scheme == .dark ? .black : .white : .primary)
                                       .id(tab.tab)

                               }
                               .onChange(of: homeData.selectedTab, perform: { value in
                                   
                                   print("homeData.selectedTab Change trigger")
                                   withAnimation(.easeInOut) {
                                       reader.scrollTo(homeData.selectedTab, anchor: .leading)
                                   }
                               })
                           }
                       })
                       // Visible only when scrolls up
                       .opacity(homeData.offset > 200 ? Double((homeData.offset - 200) / 50) : 0)
                   }
               }
               // Default frame 60
               // Top frame = 40
               // So total = 100
               .frame(height: 60)

               if homeData.offset > 250 {
                   Divider()
               }

           }
           .padding(.horizontal)
           .frame(height: 100)
           .background(scheme == .dark ? Color.black : Color.white)
       }

    
    var size: CGFloat {
           if homeData.offset > 200 {
               let progress = (homeData.offset - 200) / 50
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

//#Preview {
//    HeaderView()
//}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        // Create an instance of the EnvironmentObject
        let homeData = HomeViewModel()

        // Inject the object into the preview using `environmentObject`
//        return ListParallexDemo()
//            .environmentObject(homeData)
        
        return  HeaderView()
            .environmentObject(homeData)
    }
     
}
