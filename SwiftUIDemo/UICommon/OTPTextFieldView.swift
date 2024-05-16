//
//  OTPTextFieldView.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 15/05/24.
//

import SwiftUI

struct OTPTextFieldView: View {
    
    
    @Binding var txtOTP: String
    @State var placeholder = "-"
    
  
    
    //keyboard State
        @FocusState private var isKeyBoardShowing : Bool

    var body: some View {
        
        ZStack{
            
            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 10){
                
                let otpCode  =  txtOTP.map{String($0)}
                
                ForEach(0..<4){ index in
                    
                    VStack{
                        
                        if(index < otpCode.count){
                            
                            let status = (isKeyBoardShowing && otpCode.count == index)
                            Text(otpCode[index])
                                .font(.customfont(.extraBold, fontSize: 18))
                                .foregroundStyle(Color.primaryApp)
                                .padding(15)
                            
                                .overlay(alignment: .center, content: {
                                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                                        .stroke(Color.primaryApp, lineWidth: 1.5)
                                        .shadow(radius: 3,x: 0,y: 3)
                                        .frame(width: 45, height: 45)
                                        
                                })
                                 .animation(.easeInOut(duration: 0.2), value: status)
                                
                        }else{
                            
                            Text(placeholder)
                                .font(.customfont(.bold, fontSize: 16))
                                .foregroundStyle(Color.secondaryText)
                                .padding(15)
                            
                                
                                .overlay(alignment: .center, content: {
                                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                                        .stroke(Color.secondary, lineWidth: 1.0)
                                        .frame(width: 45, height: 45)
                                    
                                })
                                
                        }
                        // Divider()
                    }
                    
                   
                    .frame(width: 45, height: 45)
                    
                }
                
                
            }
            
            TextField("", text: $txtOTP)
                .keyboardType(.numberPad)
                .foregroundStyle(Color.clear)
            
                .frame(width: 1,height: 1)
                .opacity(0.001)
                .blendMode(.screen)
                .focused($isKeyBoardShowing)
                .contentShape(Rectangle())
            
        }
        .onTapGesture {
            isKeyBoardShowing.toggle()
        }
       
    }
}





struct OTPTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        @State var txtCode = ""
        OTPTextFieldView(txtOTP: $txtCode)

    }
}
