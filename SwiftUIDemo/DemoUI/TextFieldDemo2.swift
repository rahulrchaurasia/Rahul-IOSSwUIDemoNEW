//
//  TextFieldDemo2.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 13/07/23.
//

import SwiftUI

struct TextFieldDemo2: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State private var firstname = String()
    @State private var lname = String()
    @State private var mob = String()
    @State private var address = String()
    @State private var permAddress = String()
    @State private var pan = String()
    @State private var aadhar = String()
    @State private var city = String()
    @State private var state = String()
   
    var body: some View {
        ScrollView{
            VStack(alignment: .leading,spacing: 22){
                
               
                CustomNavigationBar(title: "Demo Text") {
                    
                    presentationMode.wrappedValue.dismiss()
                } content: {
                    Text("kde")
               
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
                Spacer()
            }
        }
        .background(
            CustomColor.bg
        )
        
      
      
    }
}

struct TextFieldDemo2_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldDemo2()
    }
}
