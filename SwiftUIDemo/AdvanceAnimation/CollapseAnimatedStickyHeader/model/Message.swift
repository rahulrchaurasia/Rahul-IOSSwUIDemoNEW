//
//  Message.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 28/07/25.
//

import Foundation
import SwiftUICore

struct Message : Identifiable{
    
    var id = UUID().uuidString
    var message : String
    var username : String
    var tintColor : Color
    
    
    
    // --- Add this static property for dummy data ---
        static let allMessages: [Message] = [
            Message(message: "Hey, how's it going?", username: "Alice", tintColor: .pink),
            Message(message: "Pretty good! Just working on this SwiftUI app.", username: "Bob", tintColor: .blue),
            Message(message: "Nice! What are you building?", username: "Alice", tintColor: .pink),
            Message(message: "A chat interface. I'm testing the UI now.", username: "Bob", tintColor: .blue),
            Message(message: "Looks great! Keep it up. 👍", username: "Charlie", tintColor: .green),
            
            Message(message: "Hey! How are you?", username: "Alice", tintColor: .blue),
                    Message(message: "I'm good! Just working on a project.", username: "Bob", tintColor: .green),
                    Message(message: "That’s great. Need any help?", username: "Alice", tintColor: .blue),
                    Message(message: "Maybe later, thanks! 😊", username: "Bob", tintColor: .green),
                    Message(message: "No problem. Ping me anytime!", username: "Alice", tintColor: .blue),
            
            Message(message: "Hey! How are you?", username: "Alice", tintColor: .blue),
                    Message(message: "I'm good! Just working on a project.", username: "Bob", tintColor: .green),
                    Message(message: "That’s great. Need any help?", username: "Alice", tintColor: .blue),
                    Message(message: "Maybe later, thanks! 😊", username: "Bob", tintColor: .green),
                    Message(message: "No problem. Ping me anytime!", username: "Alice", tintColor: .blue)


        ]
        
        // --- Optional: For a single sample item ---
        static let sample = Message(
            message: "This is a single sample message.",
            username: "dev_user",
            tintColor: .purple
        )
    
}
