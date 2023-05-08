//
//  CustomTextFieldView.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 27/03/23.
//

import SwiftUI

struct TextFieldView: View {
    
    @Binding var textValue : String
   
  
    var textHint: String
    var isSecure : Bool
    var body: some View {
        
        if(isSecure){
            SecureField("Enter Name", text: $textValue)
                .font(.title2)
                .padding(15)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color("textbg"))
                .cornerRadius(12)
            
        }else{
            TextField(textHint, text: $textValue)
               
                .font(.title2)
                .padding(15)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color("textbg"))
                .cornerRadius(12)
            
          
        }
       
        
       
        
    }
}

struct LabelView: View {
    
    var labelValue : String
    var body: some View {
        Text(labelValue)
            .font(.title3)
            .foregroundColor(.black)
    }
}

