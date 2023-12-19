//
//  ActorDemo.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 03/07/23.
//

import SwiftUI

actor Counter {
    
    
    var value : Int = 0
    
    func increment() -> Int{
        
       value += 1
        
        return value
    }
}

struct ActorDemo: View {
    var body: some View {
        
        let counter = Counter()
        
        VStack{
            
            Text("Title")
                .font(.customfont(.medium, fontSize: 50))
                .foregroundStyle(.blue)
            
            
            Text("Sub-Title")
                .font(.customfont(.medium, fontSize: 20))
                .foregroundStyle(.gray)
            Spacer()
            
            Button {
                
                DispatchQueue.concurrentPerform(iterations: 20) { i in
                    
                    Task{
                        
                        print(await " Start \(i) Value and Increment is \(counter.increment())")
                    }
                   
                }
               
            } label: {
              
                Text("Counter")
                    .font(.title)
                    .foregroundColor(Color.white)
                    .padding()
                    .padding(.horizontal,20)
                    .background(
                        CustomColor.skyblue
                        .cornerRadius(12)
                        
                    )
                   
                    
                   
            }
            Spacer()
        }
        

    }
}

struct ActorDemo_Previews: PreviewProvider {
    static var previews: some View {
        ActorDemo()
    }
}
