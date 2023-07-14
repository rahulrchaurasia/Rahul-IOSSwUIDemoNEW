//
//  BorderTextField.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 13/07/23.
//

import SwiftUI

struct BorderTextField: View {
    @Binding var text: String
      @State private var isEditing: Bool = false

      var placeholder: String
      var label: String

    
    var body: some View {
        VStack {
               HStack {
                   Text(label)
                       .foregroundColor(isEditing ? .blue : .gray)
                       .animation(.default)
                   Spacer()
               }
               .padding(.top, 20)
               
               TextField(placeholder, text: $text, onEditingChanged: { editing in
                   isEditing = editing
               })
               .padding()
               .background(Color.white)
               .cornerRadius(5)
               .shadow(color: .gray, radius: 1, x: 0, y: 0)
               
               Divider()
                   .background(isEditing ? Color.blue : Color.gray)
           }
           .padding(.horizontal, 20)
       }
}

struct BorderTextField_Previews: PreviewProvider {
    static var previews: some View {
        
        BorderTextField(text: .constant(""), placeholder: "Enter Name", label: "Enter Data")
    }
}
