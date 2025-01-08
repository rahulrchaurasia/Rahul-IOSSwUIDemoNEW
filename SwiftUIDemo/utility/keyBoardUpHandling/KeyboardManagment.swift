//
//  KeyboardManagment.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 14/06/24.
//

import Foundation
import SwiftUI


struct KeyboardManagement: ViewModifier {
    @State private var keyboardHeight: CGFloat = 0
    
    func body(content: Content) -> some View {
        content
            .padding(.bottom, keyboardHeight)
            .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)) { notification in
                guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
                withAnimation(.easeOut(duration: 0.5)) {
                    keyboardHeight = keyboardFrame.height
                }
            }
            .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)) { _ in
                withAnimation(.easeOut(duration: 0.1)) {
                    keyboardHeight = 0
                }
            }
    }
}

// Old Way

//struct KeyboardManagment1: ViewModifier {
//    @State private var offset: CGFloat = 0
//    func body(content: Content) -> some View {
//        GeometryReader { geo in
//            content
//                .onAppear {
//                    NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { (notification) in
//                        guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
//                        withAnimation(Animation.easeOut(duration: 0.5)) {
//                            offset = keyboardFrame.height - geo.safeAreaInsets.bottom
//                        }
//                    }
//                    NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { (notification) in
//                        withAnimation(Animation.easeOut(duration: 0.1)) {
//                            offset = 0
//                        }
//                    }
//                }
//                .padding(.bottom, offset)
//        }
//    }
//}
