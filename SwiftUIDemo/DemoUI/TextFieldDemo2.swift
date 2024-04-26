//
//  TextFieldDemo2.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 13/07/23.
//

import SwiftUI

struct TextFieldDemo2: View {
    
    @Environment(\.presentationMode) var presentationMode : Binding<PresentationMode>
    @State private var firstname = String()
    @State private var lname = String()
    @State private var mob = String()
    @State private var address = String()
    @State private var permAddress = String()
    @State private var pan = String()
    @State private var aadhar = String()
    @State private var city = String()
    @State private var state = String()
    
    @State private var text = String()
    
    var leftIcon: Image? = nil
    @State private var isPasswordVisible: Bool = false
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading,spacing: 22){
                
                
                CustomNavigationBar(title: "Demo Text") {
                    
                    self.presentationMode.wrappedValue.dismiss()
                } content: {
                    Text("Data")
                        .padding(12)
                    Button("CLose") {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                    
                }
                
                Button("new Close") {
                    self.presentationMode.wrappedValue.dismiss()
                }
                Text("Text Field Demo")
                    .font(.largeTitle)
                    .foregroundColor(Color.accentColor)
                    .strikethrough()
                    .frame(maxWidth: .infinity,alignment: .center)
                
                Spacer().frame(height: 20)
                
                Group{
                    
                    
                    CustomFieldText(name: $firstname, label: "Enter Fname").foregroundColor(Color.black)
                    CustomFieldText(name: $lname, label: "Enter Lname")
                    
                    CustomFieldText(name: $mob, label: "Enter MobileNo",required: false)
                    
                    
                    
                    
                }.padding(.horizontal,20)
                
                Group{
                    Text("Default Text Field Style").font(.headline)
                    HStack {
                        Image(systemName: "magnifyingglass")
                        TextField("Search...", text: $permAddress)
                    }
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                .padding(.horizontal)
                
                Group{
                    Text("Underline Text Field Style").font(.headline)
                    HStack {
                        Image(systemName: "magnifyingglass")
                        TextField("Search city...", text: $city)
                        
                    }
                    .underlineTextField()
                }
                .padding(.horizontal)
                
                Group{
                    Text("Custom ViewModifier Text Field").font(.headline)
                    HStack {
                        Image(systemName: "magnifyingglass")
                        TextField("Enter PAN...", text: $pan)
                        
                    }
                    .customTextViewModifier(roundedCornes: 25, textColor: Color.black)
                }
                .padding(.horizontal)
                
                // TextField with Icon Toggle xxzscz sd
                TextFieldWithCustionUIAndIcon
                    .padding(.horizontal)
                
                // TextField with Icon Toggle using Struct Binding
                CallTextFiledWithStruct
                    .padding(.horizontal)
                    
                Spacer()
            }
        }
        .background(
            CustomColor.bg
        )
        
        
        
    }
}


private extension  TextFieldDemo2 {
    
    var TextFieldWithCustionUIAndIcon : some View {
        Group{
            
            VStack(spacing : 10) {
                
                Text("Custom ViewModifier Text Field").font(.headline)
                HStack {
                    Image(systemName: "magnifyingglass")
                    
                    
                    Group {
                        if isPasswordVisible {
                            TextField("Enter a password", text: $pan)
                        }else {
                            SecureField("Enter a password", text: $pan)
                        }
                    }
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    
                    Spacer()
                    
                    Button {
                        isPasswordVisible.toggle()
                    } label: {
                        Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                    }
                    
                    
                }
                .customTextWithIconViewModifier(roundedCornes: 25, textColor: Color.black)
                
                
            }
            
        }
    }
   
    
}

private extension  TextFieldDemo2 {
    
    var CallTextFiledWithStruct : some View {
        
        Group{
            
            CustomTextFieldWithEye(placeHolder: "Enter Passsword", text: $text)
        }
    }
}
struct TextFieldDemo2_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldDemo2( )
    }
}
