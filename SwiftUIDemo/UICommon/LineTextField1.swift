//
//  LineTextField1.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 11/06/24.
//

import Foundation
import SwiftUI
struct LineTextField1 : View {
    
    @State var title: String = "Title"
    @State var placholder = "Placholder"
    @Binding var txt: String
    @State var keyboardType: UIKeyboardType = .default
    @State private var isError: String = ""
    var maxLength: Int = 50
    
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
                .onChange(of: txt) { newValue in
                                    // Clear the error message when the user starts
                    // Limit the length of the text
                                        if newValue.count > maxLength {
                                            txt = String(newValue.prefix(maxLength))
                                            
                                            
                                                
                                                
                                        }
                  }
            
            Divider()
        }
    }
}

#Preview {
    LineTextField1( txt: .constant("Enter name"))
}
