//
//  CircularProgressDemo.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 13/06/23.
//

import SwiftUI

struct CircularProgressDemo: View {
    @State private var progress: Double = 0.0
    var body: some View {
        VStack {
                 CircularProgressView(progress: $progress)
                     .frame(width: 150, height: 150)
                 
                 Button("Start Progress") {
                     simulateProgress()
                 }
             }
    }
    
    func simulateProgress() {
            progress = 0.0
            
            Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
                progress += 0.01
                
                if progress >= 1.0 {
                    timer.invalidate()
                }
            }
        }
}



struct CircularProgressDemo_Previews: PreviewProvider {
    static var previews: some View {
        CircularProgressDemo()
    }
}
