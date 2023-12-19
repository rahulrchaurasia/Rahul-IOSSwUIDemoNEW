//
//  ActorDemo3.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 10/11/23.
//

import SwiftUI

actor User1 {
    var score = 10

    func printScore() {
        print("My score is \(score)")
    }

    func copyScore(from other: User1) async {
        score = await other.score
    }
}



struct ActorDemo3: View {
    
    let actor1 = User1()
    let actor2 = User1()
    
    var body: some View {
      
        VStack{
            
            Button(action: {
                debugPrint("Done")
                
                Task{
                    
                   
                    await print(actor1.score)
                    await actor1.copyScore(from: actor2)
                    
                }
               
            }, label: {
              
                Text("Actor Demo")
                    .font(.title2)
                    .foregroundStyle(.white)
                    .padding()
                    .padding(.horizontal,20)
                    .background(Color.accentColor.opacity(0.6))
                    .clipShape(
                        .rect(cornerRadius: 20)
                    )
                    
            })
        }
        
        
    }
}

#Preview {
    ActorDemo3()
}
