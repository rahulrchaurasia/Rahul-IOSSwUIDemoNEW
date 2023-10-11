//
//  ClosureDemo2.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 06/10/23.
//

import SwiftUI

struct ClosureDemo2: View {
    
    // Define a @State property to hold a number
    
    @State private var number = 5
    @State private var Data = ""
    
    // Define a closure property that takes an Int parameter and returns an Int
    //var onTapCallback: () -> Void
    private var squareClosure :(Int) -> Int  = { number in
        
        return number * number
        
    }
    
    let greetClosure : ((Int?)-> String) = { number in
        
        if let number = number {
            
            return "Closure has \(number)"
        }else{
            
            return "Closure has no data"
        }
        
    }
    var body: some View {
        VStack {
            Text("Number: \(number)")
                .font(.title)
            
            Text("Square: \(squareClosure(number))")
                .font(.title)
            
            Text("Demo 2 : \(Data)")
                .font(.title)
            
            Button(action: {
                // Update the number using a random value
                number = Int.random(in: 1...10)
            }) {
                Text("Randomize Number")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            Button(action: {
                // Update the number using a random value
               // Data =  greetClosure(42)
                Data =  greetClosure(nil)
            }) {
                Text("Randomize Number")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
        }
        .padding()
    }
}

//struct ClosureDemo2_Previews: PreviewProvider {
//    static var previews: some View {
//        ClosureDemo2(.Constant)
//    }
//}
