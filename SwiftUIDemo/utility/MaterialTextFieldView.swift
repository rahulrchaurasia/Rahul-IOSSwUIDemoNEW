//
//  MaterialTextFieldView.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 02/02/24.
//

import Foundation
import SwiftUI

struct MaterialTextFieldView: View {
    @State private var text = ""
    
    var body: some View {
        
        ZStack {
            TextField("Hello world", text: $text)
                .textFieldStyle(.roundedBorder)
                .frame(width: 200)
            
            Text("Required *")
                .font(.caption2)
                .offset(x: -55, y: -16)
        }
    }
}


struct MaterialTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        
        MaterialTextFieldView()
    }
}
