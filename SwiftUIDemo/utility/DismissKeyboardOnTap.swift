//
//  DismissKeyboardOnTap.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 19/07/23.
//

import SwiftUI
import Foundation

struct DismissKeyboardOnTap: ViewModifier {
    @State private var isKeyboardVisible: Bool = false
    
    func body(content: Content) -> some View {
         content
             .onTapGesture {
                 UIApplication.shared.windows.first?.rootViewController?.view.endEditing(true)
             }
             .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)) { _ in
                 withAnimation {
                     isKeyboardVisible = true
                 }
             }
             .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)) { _ in
                 withAnimation {
                     isKeyboardVisible = false
                 }
             }
             .ignoresSafeArea(.keyboard, edges: .bottom)
     }
}
