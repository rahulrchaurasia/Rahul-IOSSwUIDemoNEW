//
//  CustomSlidingTab.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 02/01/24.
//
/*
 https://medium.com/@c64midi/android-style-segmented-control-in-swiftui-f2d9e8469bdf

 */

import SwiftUI
struct CustomSlidingTab: View {
    @ObservedObject var viewModel =  CustomTabViewModel()

    var body: some View {
        VStack{

            CustomSegmentedView(selectedSegment: $viewModel.selectedSegment)

            TabView(selection: $viewModel.selectedSegment){
                OpenView()
                    .tag(Segment.open)
                CompletedView()
                
                    .tag(Segment.completed)
                CancelledView()
                    .tag(Segment.cancelled)
                AllView()
                    .tag(Segment.all)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never)
            )
            .truncationMode(.tail)
            
            .transition(.slide)

           
            
        }
    }
}



struct CustomSlidingTab_Previews: PreviewProvider {
    static var previews: some View {
        CustomSlidingTab()
    }
}
