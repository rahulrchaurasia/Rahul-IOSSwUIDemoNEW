//
//  UIViewRepresentableHandling.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 20/07/23.
//

import Foundation
import SwiftUI

struct TextEditorWrapper : UIViewRepresentable{
   
    @Binding var text: String
       var keyboardType: UIKeyboardType = .default
       var returnKeyType: UIReturnKeyType = .default

       func makeUIView(context: Context) -> UITextView {
           let textView = UITextView()
           textView.delegate = context.coordinator
           textView.keyboardType = keyboardType
           textView.returnKeyType = returnKeyType
           textView.setContentCompressionResistancePriority(.defaultLow, for: .horizontal) // Optional: Prevent horizontal compression
           return textView
       }

       func updateUIView(_ uiView: UITextView, context: Context) {
           uiView.text = text
       }

       func makeCoordinator() -> Coordinator {
           Coordinator(text: $text)
       }

       class Coordinator: NSObject, UITextViewDelegate {
           @Binding var text: String

           init(text: Binding<String>) {
               _text = text
           }

           func textViewDidChange(_ textView: UITextView) {
               text = textView.text
           }
       }
    
}
