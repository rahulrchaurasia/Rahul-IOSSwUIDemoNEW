//
//  SubscriberDemo2.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 01/07/23.
//

import SwiftUI
import Combine



struct SubscriberDemo2: View {
    
    @State private var numbers: [Int] = []
    
    private var sinkCancellable: AnyCancellable?
    
    var body: some View {
        VStack {
            Text("Received Numbers:")
                .font(.title)
                .padding()
            
            ForEach(numbers, id: \.self) { number in
                Text("\(number)")
                    .font(.headline)
            }
        }
       
    }
}

struct SubscriberDemo2_Previews: PreviewProvider {
    static var previews: some View {
        SubscriberDemo2()
    }
}
