//
//  FloatingTextFieldDemo.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 02/02/24.
//

import SwiftUI

struct FloatingTextFieldDemo: View {
    
    @State var emailAddress : String = ""
    @State var password : String = ""
    var body: some View {
        
        ZStack {
            CustomColor.bg.opacity(0.8)
                .ignoresSafeArea(.all)
            
            VStack(alignment: .center, spacing: 10){
                
                Text("Floating Text like Material UI")
                    .padding(12)
                    .font(.title2)
                    .tint(.blue)
                
                FloatingTextFieldView(leftIcon : "person",placeHolder : "Email Address", text: $emailAddress)
                
                FloatingTextFieldView(leftIcon : "person", rightIcon: "eye",placeHolder : "Password", text: $password)
                
            }.padding()
                .padding(.horizontal)
            
            // Rounded rectangle shape with transparent edge for blending
            RoundedRectangle(cornerRadius: 20) // Adjust corner radius
                .fill(Color(UIColor.systemBackground))
                
            
                .opacity(0.2) // Adjust transparency for subtle effect
                .frame(maxWidth: UIScreen.main.bounds.width - 40, maxHeight: 400) // Ensure full coverag
        }
      
        
       
    }
}

#Preview {
    FloatingTextFieldDemo()
}
