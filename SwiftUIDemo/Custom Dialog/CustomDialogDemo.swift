//
//  CustomDialogDemo.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 02/02/24.
//

import SwiftUI
import TTGSnackbar

struct CustomDialogDemo: View {
    
    @State private var isPopupVisible = false
    @State private var isSheetVisible = false
    @State private var person = ""
    
    @StateObject var vm =  OTPAlertViewModel()
    

    var body: some View {
        VStack(alignment: .leading,spacing : 15){
            
            VStack{
                
                ZStack{
                    
                    Color(.systemBackground)
                        .ignoresSafeArea()
                    
                    VStack(spacing: 10){
                        Text("Custom Demo :")
                            .font(.system(size: 32,weight: .bold))
                            .underline()
                            .padding([.leading,.bottom])
                        
                           
                    FloatingTextFieldView(leftIcon : "person.badge.plus",placeHolder : "Name", text: $person).padding(.horizontal,10)
                        
                        FloatingTextFieldView(leftIcon : "person",placeHolder : "Email Address", text: $vm.dynamicText).padding(.horizontal,10).padding(.top)
                            
                        CustomButton(title: "Sheet Popup") {
                            isSheetVisible.toggle()
                        }.padding(.horizontal,30)
                            .padding(.top)
                        
                        CustomButton(title: "Custom Alert") {
                            vm.handleCustomPopUp()
                        }.padding(.horizontal,30)
                    
                        
                        CustomButton(title: "Snakbar Demo") {
//                         var snakebar =    TTGSnackbarRepresentable(
//                                           message: "This is the message",
//                                           duration: .middle,
//                                           actionText: "OK",
//                                           actionBlock: { snackbar in
//                                               print("Action clicked!")
//                                           },
//                                           icon: UIImage(systemName: "info.circle")
//                                       )
                            
                            snackBar(message: "Show Data")
                            
                        }.padding(.horizontal,30)
                        Spacer()
                    }
                    
                   
                    .blur(radius: vm.isShowingDetails ? 10 : 0)
                    
                    .allowsHitTesting(vm.isShowingDetails ? false : true)
                    

                    if vm.isShowingDetails {
            
                        //passing refrence of our StateObject vm to Child
                        OTPAlertView(vm: vm)
                            .offset(y:-40)
                    }
                }
            }
            
           
        }
       
       
        .sheet(isPresented: $isSheetVisible) {
                    if #available(iOS 16.0, *) {
                       
                        OTPSheetView(vm: OTPAlertViewModel())
                    
                            
                            .presentationDetents([.medium, .large])
                    } else {
                        OTPSheetView(vm: OTPAlertViewModel())
                          
                    
                           
                    }
                }
        
        
    }
    
    func snackBar(message : String){
        
        let snackbar = TTGSnackbar(
            message: message,
            duration: .middle,
            actionText: "OK",
            
            actionBlock: { (snackbar) in
                print("Click action!")
            }
        )
        //appIcon
        snackbar.icon = UIImage(named: "info_icon")
        snackbar.show()
    }
}



struct CustomDialogDemo_Previews: PreviewProvider {
    static var previews: some View {

        
        CustomDialogDemo()
    }
}
