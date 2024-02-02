//
//  OTPTextField.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 30/01/24.
//

import Foundation
import SwiftUI


struct OTPTextField: UIViewRepresentable {
    @Binding var text: String
    var isFocused: Bool
    var onCommit: () -> Void

    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField()
        textField.delegate = context.coordinator
        textField.keyboardType = .numberPad
        textField.textAlignment = .center
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.backgroundColor = isFocused ? .lightGray : .white
        return textField
    }

    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
        uiView.isUserInteractionEnabled = !text.isEmpty
        uiView.layer.borderColor = isFocused ? UIColor.blue.cgColor : UIColor.gray.cgColor
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UITextFieldDelegate {
        let parent: OTPTextField

        init(_ parent: OTPTextField) {
            self.parent = parent
        }

        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            guard let text = textField.text else { return true }
            let newLength = text.count + string.count - range.length
            return newLength <= 1
        }

        func textFieldDidChangeSelection(_ textField: UITextField) {
            parent.text = textField.text ?? ""
        }

        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            parent.onCommit()
            return false
        }
    }
}
