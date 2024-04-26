//
//  FloatingTextFiledView1.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 03/02/24.
//

import Foundation
import SwiftUI

struct FloatingTextFieldView1: View {
    var leftIcon: String? = nil
    var rightIcon: String? = nil
    var placeHolder: String? = nil

    @Binding var text: String

    @State private var isEditing = false
    @State private var edges = EdgeInsets(top: 0, leading: 45, bottom: 0, trailing: 0)

    private enum Field: Int, Hashable {
        case fieldName
    }

    @FocusState private var focusField: Field?

    var body: some View {
        ZStack(alignment: .leading) {
            HStack {
                if let leftIcon = leftIcon {
                    Image(systemName: leftIcon)
                        .foregroundColor(Color.secondary)
                }

                TextField("", text: $text) { status in
                    DispatchQueue.main.async {
                            isEditing = status
                            edges = isEditing ? EdgeInsets(top: 0, leading: 15, bottom: 60, trailing: 0) : EdgeInsets() // Use EdgeInsets() for zero insets
                        }
                }
                .focused($focusField, equals: .fieldName)

                if let rightIcon = rightIcon {
                    Image(systemName: rightIcon)
                        .foregroundColor(Color.secondary)
                }
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 5)
                .stroke(Color("border")))

            Text(placeHolder ?? "")
                .background(Color(UIColor.systemBackground))
                .foregroundColor(Color.secondary)
                .padding(edges)
                .animation(.easeInOut(duration: 0.4), value: edges)
                .onTapGesture {
                    self.focusField = .fieldName
                }
        }
        .frame(height: 45)
        .animation(.easeInOut(duration: 0.4), value: isEditing && text.isEmpty)
    }
}

struct FloatingTextFieldView1_Preview : PreviewProvider {
    static var previews: some View {
        FloatingTextFieldView(leftIcon : "person", placeHolder: "Email", text: .constant(""))
    }
}

