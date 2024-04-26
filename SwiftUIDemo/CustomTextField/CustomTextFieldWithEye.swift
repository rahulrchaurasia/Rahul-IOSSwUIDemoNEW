//
//  CustomTextFieldWithEye.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 09/02/24.
//

import SwiftUI

struct CustomTextFieldWithEye: View {
    
    var placeHolder : String
    @Binding var text: String
    @State private var isPasswordVisible: Bool = false
    //var onToggle: (() -> Void)? // Optional closure
    
    var body: some View {
        HStack(spacing : 0) {
            Image(systemName: "magnifyingglass")
                .frame(width: 4)
                .padding(.leading,12)
            // Spacer for flexibility
                
            Group {
                if isPasswordVisible {
                    TextField(placeHolder, text: $text)
                }else {
                    SecureField(placeHolder, text: $text)
                }
            }
            .padding()
            
            .disableAutocorrection(true)
            .autocapitalization(.none)
            
          
            
            Button {
                isPasswordVisible.toggle()
                
            } label: {
                Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                    
                    .background(Color.clear)
                        .contentShape(Rectangle())
                        // Increase the frame size here
                        .frame(width: 50)
                        .frame(maxHeight: .infinity) //
                        //.background(Color.red)
                    
            }
            
            
        }
       
        .padding(.leading,10)
        .cornerRadius(25)
        
        .foregroundColor(Color.black)
        .overlay(
          RoundedRectangle(cornerRadius: 25)
            .stroke(lineWidth: 1)
            .foregroundColor(Color.gray.opacity(0.7))
        )
        .font(.custom("Open Sans", size: 17))
        .shadow(radius: 10)
        
    }
}

#Preview {
    CustomTextFieldWithEye(placeHolder: "Enter Password", text: .constant(""))
}
