//
//  OneTimeCodeBoxes1.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 05/02/24.
//

import SwiftUI

struct OneTimeCodeBoxes1: View {
    
    @Binding var codeDict :[Int : String]
   
    @State var firstResponderIndex : Int = 0
    var oncommit: (()-> Void)?  // nothing is pass therer only call back no parameter. It will trigger only  full  otp text is filled that logic in updateUIView  of OneTimeCodeInput.
    
    
    var body: some View {
        
        HStack{
            ForEach(0..<codeDict.count, id: \.self){ i in
                
                let isEmptyOTP = codeDict[i]?.isEmpty == true
                OneTimeCodeInput(
                    index: i,
                    codeDict: $codeDict,
                    firstResponderIndex: $firstResponderIndex,
                    oncommit: oncommit
                )
                
                .frame(width: 60, height: 60)
                //.aspectRatio(1,contentMode: .fit)
                
                .overlay {
                    
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: isEmptyOTP ? 1 : 2)
                        .foregroundStyle(isEmptyOTP ? .secondary : CustomColor.skyblue )
                        .shadow(
                            color: isEmptyOTP ? .black.opacity(0.5) :
                                .blue.opacity(0.5),
                            
                            radius: 12, x: 4, y: 8)
                }
            }
        }
    }
}



struct OneTimeCodeBoxes1_Previews: PreviewProvider {
    static var previews: some View {
        OneTimeCodeBoxes1(codeDict: .constant([0:"",1: "",2:"",3:""]))
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
