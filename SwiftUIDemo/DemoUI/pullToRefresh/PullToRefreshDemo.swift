//
//  PullToRefreshDemo.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 03/08/23.
//

import SwiftUI

struct PullToRefreshDemo: View {
    
    @State private var refreshDates : [Date] = []
    var body: some View {
       
        List(refreshDates,id: \.self) { date in
            
            Text("\(date)")
            
        }.listStyle(.plain)
            .refreshable {
               
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                    
                    let currentDate = Date()
                    refreshDates.append(currentDate)
                }
            }
        
        .navigationTitle("Pull to Refresh")
    }
}

struct PullToRefreshDemo_Previews: PreviewProvider {
    static var previews: some View {
        PullToRefreshDemo()
    }
}
