//
//  View+Extension.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 14/06/23.
//

// For For a TextField in SwiftUI, using a ViewModifier is typically more suitable than a ViewBuilder.
import Foundation
import SwiftUI

extension View {
    
    var getWidth: CGFloat {
            UIScreen.main.bounds.width
        }
    
    func circularText() -> some View {
        self.modifier(CircularText())
    }
    
    
    //added :05otp
    func disableWithOpacity(_ condition : Bool) -> some View {
        
        self
            .disabled(condition)
            .opacity(condition ? 0.6 : 1)
        
    }
    
    func underlineTextField() -> some View {
            self
                .padding(.vertical, 10)
                .overlay(Rectangle().frame(height: 2).padding(.top, 35).foregroundColor(Color.gray.opacity(0.5)))
                .foregroundColor(Color.black)
                
                .padding(10)
        }
    
    func customTextViewModifier( roundedCornes: CGFloat,
     textColor: Color) -> some View {
        
        self.modifier(CustomTextViewModifier(roundedCornes: roundedCornes, textColor: textColor))
    }
    
    func customTextWithIconViewModifier(roundedCornes: CGFloat, textColor: Color) -> some View {
        self.modifier(CustomTextWithIconViewModifier(roundedCornes: roundedCornes, textColor: textColor))
      }
   
    
    
    func hideKeyboard() {
           UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
       }
    
    
    func scrollIndicatorsCustomModifier() -> some View {
            modifier(ConditionalScrollIndicatorsModifier())
        }
    
/***********************************************************************/
       // Using  @ViewBuilder
/***********************************************************************/
    @ViewBuilder
   func formattedText(_ text: String, backgroundColor: Color, foregroundColor: Color = .black) -> some View {
           Text(text)
               .font(.largeTitle)
               .frame(width: 250, height: 250)
               .padding()
               .background(backgroundColor)
               .foregroundColor(foregroundColor)
               .cornerRadius(15)
       }

   
/***********************************************************************/
    // Using  Keyboard Handling  
    //Move TextField up when the keyboard has appeared in SwiftUI
/***********************************************************************/
    func adaptsToKeyboard() -> some View {
           return modifier(AdaptsToKeyboard())
       }
    
    func keyboardManagment() -> some View {
           self.modifier(KeyboardManagement())
       }
    
    
    /***********************************************************************/
        // Alert View
        //Verify network and alert popup
    /***********************************************************************/

    
    func withNetworkAlert() -> some View {
           modifier(NetworkStatusModifier())
       }
   
}




