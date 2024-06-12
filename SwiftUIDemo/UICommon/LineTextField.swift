//
//  LineTextField.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 28/05/24.
//

import SwiftUI

//Mark : Handling Error Message and Error stroke
struct LineTextField: View {
    
    var title: String = "Title"
    var placholder = "Placholder"
    @Binding var txt: String
    var keyboardType: UIKeyboardType = .default
    
    var isError: Bool
    var errorMessage: String?
   
    
    var body: some View {
        VStack(spacing:4){
            Text(title)
                .font(.customfont(.regular, fontSize: 14))
                .foregroundColor(.placeholder)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            TextField(placholder, text: $txt)
                .keyboardType(keyboardType)
                .autocapitalization(.none)
                .autocorrectionDisabled()
                .submitLabel(.next)
                .frame(height: 30)
                
                  
            
            Divider()
                .frame(height: isError ?  1.5 : 1  )
                .background(isError ? Color.red.opacity(0.7) : Color.gray.opacity(0.4))
            
            if isError, let errorMessage = errorMessage {
                            Text(errorMessage)
                                .font(.caption)
                                .foregroundStyle(Color.red)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading,6)
                                .padding(.top,3)
                        }

        }
    }
}

#Preview {
    LineTextField( txt: .constant("Enter name"), isError: true,errorMessage: "Enter name")
}
