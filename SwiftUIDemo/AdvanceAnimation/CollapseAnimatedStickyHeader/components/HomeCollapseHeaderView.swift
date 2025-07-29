//
//  HomeCollapseHeaderView.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 24/07/25.
//
/*

 .background(_:in:)    Draws rounded shape behind, but content (text, image, button) stays uncut.
 .clipShape(...)    Entire view is masked to shape. Rounded corners are real cuts, not just background.
 
 
 Step1 >
 You want to track how far the ScrollView has scrolled, especially to animate or collapse the top bar (HomeCollapseTopBar) based on scroll position.

 Instead of mixing offset tracking code directly into your ScrollView layout, you extract it into a reusable, isolated piece — a ViewModifier.

 That’s clean, modular, and reusable ✅
 
 
 Step2 >
 
 What happens here:
 The .modifier(...) is called on the VStack inside ScrollView.

 That VStack is the content of the ScrollView.

 So you're tracking the global offset of the ScrollView's contents, not the outer ScrollView frame itself.

 Each scroll will trigger GeometryReader, updating minY (and eventually offset via binding).
 
 
 step3 :
 
 HomeCollapseTopBar(...)
     .frame(maxWidth: .infinity)
     .frame(height: maxHeight + offset, alignment: .bottom)

 At scroll start → offset = 0, height = maxHeight
 As you scroll down → offset becomes negative, and height shrinks
 As you pull down → offset becomes positive, and height grows


 Combined with .offset(y: -offset)
 You’ve also written:

    .offset(y: -offset)
 * This is the final step to pin the header at the top as you scroll.
 * Cancels out the scroll movement so the header appears “fixed” while other content scrolls behind it.

 .offset(y: -offset) is essentially used to cancel out the scroll movement applied by the user on that specific view, so that the view appears "fixed" or "pinned" at the top, even though it's technically inside a ScrollView.


 ✅ Why use .offset(y: -offset)?
 What happens without it?
 * As you scroll down (drag upward), the view naturally scrolls upward with the content.
 * So, your header would scroll off the screen like any other content.
 What happens with .offset(y: -offset)?
 * When the ScrollView moves down by offset = +50, this .offset(y: -50) moves the header back up by 50 points.
 * This cancels out the visual scroll on just this view — making it look like it's pinned at the top.



 Concept    Explanation
 .offset(y: -offset)    Moves the view upward by the scroll amount
 Purpose    Cancels out the scroll movement from the ScrollView
 Visual Effect    The view sticks at the top of the screen (like it's fixed), even though it's inside the scroll
 
 
 step4 :
 Why .frame(height: 80 + topEdge) inside the overlay?
 This is very important for layout, and here's why:
 80 → Gives your top bar (buttons row) a fixed visible height (standard nav bar height).
 + topEdge → Compensates for safe area insets (like the notch or status bar at the top on iPhones).
 If you don’t include + topEdge, your buttons might be cut off or go under the notch, especially on devices like iPhone 13, 14, etc.


 */

import SwiftUI

struct HomeCollapseHeaderView: View {
    
    
    var topEdge : CGFloat  // vvimp **get its value from parent, we passing it construct HomeCollapseHeaderView(topEdge : topEdge)
    
    var fullViewHeight: CGFloat // ✅ Accept the full height
    let minHeight: CGFloat = 80 // You can adjust this to taste
    
    let maxHeight = UIScreen.main.bounds.height / 2.3
    
    @Environment(\.presentationMode) var presentationMode
    //Offset
    @State var offset : CGFloat = 0
    
    // Use the static property as the source of truth
       let allMessages: [Message] = Message.allMessages
    var body: some View {
        
        
        
        ScrollView(.vertical,showsIndicators: false) {
            
            VStack(spacing: 15){
                //Top Nav View
                GeometryReader{ proxy in
                    
                    HomeCollapseTopBar(topEdge: topEdge, offset: $offset, maxHeight : maxHeight)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                    
                    //Sticky Effort
                    
                        .frame(height: getHeaderHeight(), alignment: .bottom)
                    
                        .background(Color.skyblue,
                                    in:
                                        CustomCorner(corners: [.bottomRight], radius: getCornerRadius())
                        )
                    
                    
                        .overlay(alignment: .top) {
                            
                            //Top Nav items ..
                            
                            HStack(spacing: 15) {
                                
                                Button {
                                    
                                    presentationMode.wrappedValue.dismiss()
                                    
                                } label: {
                                    
                                    Image(systemName: "xmark")
                                        .font(.body.bold())
                                    
                                }
                                // ✅ Collapsed Title + Image
                                HStack(spacing: 8) {
                                    Image("choclate")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 35, height: 35)
                                        .clipShape(Circle())
                                    
                                    Text("Shopping")
                                        .font(.headline)
                                        .bold()
                                        .foregroundStyle(Color.primaryText)
                                }
                                .opacity(topBarTitleOpacity())
                                
                                
                                Spacer()
                                
                                Button {
                                    
                                } label: {
                                    
                                    Image(systemName: "line.3.horizontal.decrease")
                                        .font(.body.bold())
                                    
                                }
                                
                                
                            }
                            .padding(.horizontal,20)
                            //.padding(.bottom,20)
                            //Max Height
                            .frame(height: 80)
                            .foregroundStyle(.white)
                            .padding(.top , topEdge)
                        }
                    
                }
                .frame(height: maxHeight)
                
                //fixing at top
                .offset(y: -offset)
                
                // The zIndex ensures the header draws over the content during scroll
                .zIndex(1)
                
                // MARK: 4. Content List
                // Sample Messages
                VStack(spacing: 15) {
                    
                    ForEach(allMessages) { message in
                        
                        // Card view ...
                        HomeCollapseMessageCardView(message: message)
                    }
                }
                .padding()
                
                .zIndex(0)
                
            }
            .modifier(OffsetModifier(offset: $offset))
            
          // ✅ THE FIX: Ensure the content VStack is at least as tall as the screen.
            .frame(minHeight: fullViewHeight)
        }
        //setting coordinate space
        
        .coordinateSpace(name: "SCROLL")
        
        // ✅ ADDED: This is the standard way to handle the bottom safe area.
        .safeAreaInset(edge: .bottom) {
            // This adds 20pts of padding IN ADDITION to the safe area.
            // The ScrollView's content will now correctly stop above the home indicator.
            Spacer().frame(height: 20)
            //Color.clear.frame(height: 20)
        }
    }
    
    
    
    func getHeaderHeight() -> CGFloat {
        
       let topHeight = maxHeight + offset
        
        //80 is constant top nav bar height
        //
        
        return topHeight > (80 + topEdge) ? topHeight :(80 + topEdge)
    }
    
    func getCornerRadius() -> CGFloat {
        
        let progress = -offset / (maxHeight - (80 + topEdge))
        
        let value = 1 - progress
        let radius = value * 50
        return  offset < 0 ? radius : 50
    }
    
    func topBarTitleOpacity()-> CGFloat {
        
        // to satrt after main content vanished ..
        //we need to eleminate 70  from offset
        
        let progress = -(offset + 60) / (maxHeight - (80 + topEdge))
        
        return min(max(progress, 0), 1)
        //return progress
    }
    
}

#Preview {
    //HomeCollapseHeaderView()
    CollapseAnimatedStickyHeader()
}


