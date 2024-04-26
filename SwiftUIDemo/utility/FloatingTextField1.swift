//
//  FloatingTextField.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 13/07/23.
//

import SwiftUI

struct FloatingTextField1: View {
    
    @Binding var text: String
    var placeholder: String
    var label: String
    
    @State private var isEditing: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(label)
                .font(.caption)
                .foregroundColor(isEditing ? .blue : .gray)
                .offset(x: 0, y: isEditing || !text.isEmpty ? -25 : 0)
                .scaleEffect(isEditing || !text.isEmpty ? 0.8 : 1.0, anchor: .leading)
                .animation(.spring())
            
            ZStack(alignment: .leading) {
                if text.isEmpty {
                    Text(placeholder)
                        .foregroundColor(.gray)
                        .font(.subheadline)
                        .padding(.leading, 4)
                }
                TextField("", text: $text)
                    .foregroundColor(.black)
                    .font(.subheadline)
                    .padding(.leading, 4)
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 4)
            .background(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(isEditing ? Color.blue : Color.gray, lineWidth: 1)
            )
        }
        .padding(.horizontal)
        .animation(.default)
    }
    
}
    


struct FloatingTextField_Previews: PreviewProvider {
    static var previews: some View {
        FloatingTextField1(text: .constant(""), placeholder: "Enter Name", label: "Enter Data")
    }
}
