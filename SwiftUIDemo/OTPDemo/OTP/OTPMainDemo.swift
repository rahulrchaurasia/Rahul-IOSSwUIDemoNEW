//
//  OTPMainDemo.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 31/01/24.
//

//https://www.youtube.com/watch?v=Ry_OrXcXepM

import SwiftUI

struct OTPMainDemo: View {
    
    static let codeDigit = 4
    
    @State
      var codeDict = Dictionary<Int,String>(uniqueKeysWithValues: (0..<codeDigit).map{($0,"")}
      )
    
    var code : String {
        
        codeDict.sorted(by:{$0.key < $01.key}).map(\.value).joined()
        
    }

    
    var body: some View {
        
        VStack(alignment: .leading, spacing : 40) {
            Text("PolicyBossPro,One Time Password")
                .font(.system(size: 28,weight: .bold))
                .padding(.top,20)
                .multilineTextAlignment(.leading)
               
            OneTimeCodeBoxes1(codeDict:$codeDict,
                             oncommit: {
            
                // trigger after all OTP get filled
                print("Final Done \(code)")
            })
            .onChange(of: codeDict) { newValue in
                
            }.padding()
                
           
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Resend Code")
                    .font(.title2)
                    .underline()
                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                    .tint(Color.red)
                Spacer()
            })
            .padding()
           
            
            CustomButton(title: "SUBMIT") {
                debugPrint("OTP Validate")
            }
            .padding(.horizontal,30)
            Spacer()
            
        
        }
        .padding()
        .frame(width:  UIScreen.main.bounds.width, alignment: .leading)
           

    }
}

#Preview {
    OTPMainDemo()
}
