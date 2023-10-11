//
//  ClosureDemo3.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 06/10/23.
//

import SwiftUI

struct ClosureDemo3: View {
    
    @State private var dataFromChildView = ""
    
    var body: some View {
        VStack {
            // Create a child view and pass in a closure to handle the transferred data
            
            Text(dataFromChildView)
                .font(.title2)
                .foregroundColor(.accentColor)
            
            ChildView { childData in
                self.dataFromChildView = childData
            }
            
        }
    }
}

struct ClosureDemo3_Previews: PreviewProvider {
    static var previews: some View {
        ClosureDemo3()
    }
}


struct ChildView: View {
    var onTapCallback: (String) -> Void

    var body: some View {
        
        VStack{
            Button(action: {
                // Call the closure, passing in the data you want to transfer
                onTapCallback("Hello from the child view!")
            }) {
                Text("Click here")
                    .foregroundColor(.blue)
                    .font(.title2)
                   
                    .padding()
                  
                   
            }
            
        }
        
    }
}
