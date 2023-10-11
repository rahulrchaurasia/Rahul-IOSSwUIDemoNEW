//
//  ClosureDemo1.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 06/10/23.
//

/*
 Note : we create Button View on which we have close on button Click
 
 when ParentView Called Button View , we have to apply closure also.
 */
import SwiftUI

struct ClosureDemo1: View {
    var body: some View {
        VStack {
                    Text("Welcome to SwiftUI Callback Example")
                        .font(.title)
                        .padding()
                    
                    // Use the ButtonWithCallback view and provide a closure for the callback
                    ButtonWithCallback {
                        print("Button tapped!") // This closure will be executed when the button is tapped
                    }
                }
    }
}

struct ClosureDemo1_Previews: PreviewProvider {
    static var previews: some View {
        ClosureDemo1()
    }
}


// Define a SwiftUI view that accepts a callback
struct ButtonWithCallback: View {
    // Define a property to store the callback function
    var onTapCallback: () -> Void
    
    var body: some View {
        Button(action: {
            // Call the callback function when the button is tapped
            onTapCallback()
        }) {
            Text("Tap Me")
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
    }
}
