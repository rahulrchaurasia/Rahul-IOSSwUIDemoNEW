//
//  OTPAlertView.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 02/02/24.
//
/*
 
  Note :  @State var isValidate we used not ViewModel has isValidate
 
 bec if we try to update ViewModel isValidate
 */
import SwiftUI

struct OTPAlertView: View {
    @ObservedObject var vm: OTPAlertViewModel
    
   
    static let codeDigit = 4
    
    @State var isValidate = true
   
    @State
      var codeDict = Dictionary<Int,String>(uniqueKeysWithValues: (0..<codeDigit).map{($0,"")}
      )
    
    @State var isOTPError = true
    
    var code : String {
        
        codeDict.sorted(by:{$0.key < $01.key}).map(\.value).joined()
        
    }


    var body: some View {
        
        mainView
        .frame(width: UIScreen.main.bounds.width - 30 , height: 400,alignment: .center)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        
        .overlay(alignment: .topTrailing) {
          
            
            Button {
               
                vm.dismissAlert()
               
                print("CLose Alert View")
            } label: {
                XDismissButton()
            }.padding(.top,4)

        }
        
      
    }
    
    
}

private extension OTPAlertView {
    
   
    var mainView: some View  {
        
        VStack() {

           
                Text("Product")
                    .font(.title)
                    .foregroundStyle(Color.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                
               
                contentView // View
            
                Divider()
                    .background(Color.blue.opacity(0.4))
                    .padding([.bottom],20)
                
                HStack(alignment: .center, spacing: 0) { // Center button within its row
                    
                    Button(action: {
                        
                        isValidate =  vm.validateOTP(strCode: code)
                        isOTPError = isValidate
                        if(isValidate){
                            
                            print("Final Done \(code)")
                        }else{
                            
                            print("Validation ")
                        }
                        
                    }, label: {
                        APButton(title: "Submit")
                    })
                    
                }.padding(.bottom)
            
            
            ///
        }
        
    }
    
    //main Container
    var contentView: some View  {
        
        ScrollView {
            
            VStack(alignment: .leading, spacing :10)
            {
                
                headerView
                
                OTPView

                if !isValidate {
                    
                    Group{
                     
                        Text(vm.errorMessage)
                            .font(.title2)
                            .foregroundStyle(Color.red)
                        
                    }
                  

                }
                Button(action: {
                    
                  
                    
                }, label: {
                    Text("Resend Code")
                        .font(.title2)
                        .underline()
                        .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                        .tint(Color.blue)
                    Spacer()
                })
                .padding()
                
            }
            
            .frame(maxWidth: .infinity, alignment: .leading) // Align content to leading
            .padding(.horizontal)
            
        }
    }
}

private extension OTPAlertView {
    
    var headerView : some View {
        Group{
            
            Text("Meals description")
                .font(.title2)
                .multilineTextAlignment(.leading)
            
            
               HStack(alignment: .center, spacing: 10, content: {
                
                Text("Price: ")
                    .font(.title3)
                    .multilineTextAlignment(.leading)
                
                Text("240 Rs")
                    .font(.title3)
                    .multilineTextAlignment(.leading)
            })
            
            
            
            Text(vm.dynamicText) // Access dynamic text from view model
                .font(.subheadline)
                .multilineTextAlignment(.leading)
            
                .fixedSize(horizontal: false, vertical: true)
            
        }
        
    }
}

private extension OTPAlertView {
    
    var OTPView : some View {
        Group{
        
            OneTimeCodeBoxes(codeDict:$codeDict, isOTPError: $isOTPError,
                             oncommit: {
            

                print("***Final Done \(code)")
                
                Task {
                        // Perform asynchronous operations or other tasks

                        // Access and use the saved state later:
                        DispatchQueue.main.async {
                           let (isVerified, message)  =  vm.validateOTP1(strCode: code)
                            
                               isValidate = isVerified
                               isOTPError = isVerified
                               vm.errorMessage = message
                        }
                    }
               
              
            })
            .onChange(of: codeDict) { newValue in
                
                isOTPError = true
            }
            
        }
    }
}

struct OTPAlertView_Previews: PreviewProvider {
    static var previews: some View {

        let vm: OTPAlertViewModel = OTPAlertViewModel()
        OTPAlertView(vm: vm)
    }
}
