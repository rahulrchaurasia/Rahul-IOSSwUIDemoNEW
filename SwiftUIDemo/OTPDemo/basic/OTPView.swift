//
//  OTPView.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 30/01/24.
//

import SwiftUI

struct OTPView: View {
    
    @State private var otpDigits = Array(repeating: "", count: 4)
        @State private var focusedIndex = 0
    
    var body: some View {
           HStack(spacing: 16) {
               ForEach(0..<4) { index in
                   OTPTextField(
                       text: $otpDigits[index],
                       isFocused: focusedIndex == index,
                       onCommit: {
                           withAnimation {
                               focusedIndex = (index + 1) % 4
                           }
                       }
                   )
                
                   .frame(width: 50, height: 50)
                       // Set focus on the first field
               }
           }
           .padding()
           .background(Color.white)
           .cornerRadius(8)
           .overlay(
               RoundedRectangle(cornerRadius: 8)
               
                   .stroke(Color.gray, lineWidth: 1)
           )
           .onReceive(NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification)) { notification in
               // Handle backspace and focusedIndex updates
               guard let textField = notification.object as? UITextField,
                     let text = textField.text,
                     !text.isEmpty else {
                   focusedIndex = max(0, focusedIndex - 1)
                   return
               }

               focusedIndex = (focusedIndex + 1) % 4
           }
       }
}

#Preview {
    OTPView()
}
