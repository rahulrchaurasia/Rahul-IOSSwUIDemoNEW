//
//  OTPVerificationView.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 23/02/24.
//

import SwiftUI

struct OTPVerificationView: View {
    
    @Environment(\.presentationMode) var presentationMode : Binding<PresentationMode>
    //view property
    @State var otpText : String = ""
    
    //keyboard State
    @FocusState private var isKeyBoardShowing : Bool
    var body: some View {
        
        VStack{
            
            Button {
                self.presentationMode.wrappedValue.dismiss()
            } label: {
                XDismissButton()
            }
            .frame(maxWidth: .infinity,alignment: .trailing)
            
            Text("Verified OTP")
                .font(.largeTitle.bold())
                .frame(maxWidth: .infinity,alignment: .leading)
            
            
            HStack(spacing : 0){
                // OTP TEXT BOXES
                
                ForEach(0..<4 , id: \.self){ index in
                    
                  OTPTextBox(index)
                }
                
                
            }
            .padding(.horizontal,50)
            .background(
            
              
                TextField("",text: $otpText.limit(4))
                    .keyboardType(.numberPad)
                    .textContentType(.oneTimeCode)
                //Hide it Out
                .frame(width: 1,height: 1)
                .opacity(0.001)
                .blendMode(.screen)
                .focused($isKeyBoardShowing)
                
                
            )
            .contentShape(Rectangle())
           
            .onTapGesture {
                isKeyBoardShowing.toggle()
            }
            
                
            .padding(.bottom,20)
            .padding(.top,10)
            
            //TextField("",text: $otpText)
            
            
            CustomButton(title: "Verify") {
                
            }
            .disableWithOpacity(otpText.count < 4)
        }
        .padding(.all)
        .frame(maxHeight: .infinity,alignment: .top)
        .toolbar {
            ToolbarItem(placement: .keyboard) {
                
                Button("Done") {
                    
                    isKeyBoardShowing.toggle()
                }
                .frame(maxWidth: .infinity,alignment: .trailing)

            }
        }
    }
}

private extension OTPVerificationView {
    
    @ViewBuilder
    func OTPTextBox(_ index : Int) -> some View{
        
        ZStack {
            if otpText.count > index {
                //Finding char At index
                
                let startIndex = otpText.startIndex
                let charIndex = otpText.index(startIndex, offsetBy: index)
                
                let charToString = String(otpText[charIndex])
                Text(charToString)
                
            }else{
                Text("")
            }
        }
        .frame(width: 45 ,height: 45)
        .background{
            //Highlight current active box
            let status = (isKeyBoardShowing && otpText.count == index)
            
            RoundedRectangle(cornerRadius: 6, style: .continuous)
                .stroke(status ? .black : .gray,
                 lineWidth: status ? 1 : 0.5)
                .animation(.easeInOut(duration: 0.2), value: status)

        }
        .frame(maxWidth: .infinity,alignment: .center)
    }
}

#Preview {
    OTPVerificationView()
}
