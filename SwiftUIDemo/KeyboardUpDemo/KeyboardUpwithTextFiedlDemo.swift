//
//  KeyboardUpwithTextFiedlDemo.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 14/06/24.
//

import SwiftUI

struct KeyboardUpwithTextFiedlDemo: View {
    
    @State private var txtName: String = ""
    @State private var txtMob: String = ""
    @State private var txtAddress: String = ""
    
    @State private var showAlert = false

    @FocusState private var focusedField : DemoField?
    
    @Environment(\.dismiss) private var dismiss
    var body: some View {
       
        ZStack{
          
                VStack(alignment: .leading, spacing : 0){
                    
                    ZStack{
                        
                        Text("KeyBoard Up Handling ")
                            .font(.customfont(.extraBold, fontSize: 20))
                            .foregroundStyle(Color.primaryText)
                        
                        HStack{
                            
                            Button {
                                dismiss()
                               
                            } label: {
                                Image("back")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                            }
                            
                            
                            
                            Spacer()
                            
                        }
                    }
                    .padding(.horizontal,20)
                    .padding(.bottom,10)
                    .padding(.top,.topInsets)
                    
                    //Seperator
                    Group{
                        Divider()
                        
                        Rectangle()
                            .fill(Color.lightWhite)
                            .frame(height: 8)
                        
                    }
                    ScrollView(showsIndicators: false){
                        
                        VStack(spacing:0){
                            
                            HStack{
                                
                                Text("Available balance")
                                    .font(.customfont(.medium, fontSize: 16))
                                    .foregroundStyle(Color.secondaryText)
                                
                                Spacer()
                                
                                Text("$54.75")
                                    .font(.customfont(.medium, fontSize: 16))
                                    .foregroundStyle(Color.secondaryText)
                                
                            }
                            .padding(20)
                            
                            HStack{
                                
                                Text("$")
                                    .font(.customfont(.medium, fontSize: 22))
                                    .foregroundStyle(Color.gray)
                                
                                
                                
                                Text("48")
                                    .font(.customfont(.medium, fontSize: 22))
                                    .foregroundStyle(Color.primaryText)
                                
                            }
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                            .padding(.leading,40)
                            
                            HStack(spacing:10){
                                
                                Button(action: {
                                    
                                }, label: {
                                    
                                    RectangleBorderView(strText: "+10")
                                })
                                Button(action: {
                                    
                                }, label: {
                                    
                                    RectangleBorderView(strText: "+20")
                                })
                                Button(action: {
                                    
                                }, label: {
                                    
                                    RectangleBorderView(strText: "+30")
                                })
                                
                                
                            }
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                            .padding([.bottom, .leading],20)
                            
                            //Seperator
                            Group{
                                Divider()
                                
                                Rectangle()
                                    .fill(Color.lightWhite)
                                    .frame(height: 8)
                                
                            }
                            
                            Text("From Bank Account")
                                .font(.customfont(.medium, fontSize: 16))
                                .foregroundStyle(Color.primaryText.opacity(0.8))
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                                .padding(.leading,20)
                                .padding(.top,20)
                            
                            
                            HStack {
                                
                                Image("bank_logo")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 60,height: 60)
                                
                                VStack( alignment: .leading, spacing: 10){
                                    
                                    Text("Standard Charted Bank")
                                        .font(.customfont(.medium, fontSize: 16))
                                        .foregroundStyle(Color.primaryText.opacity(0.8))
                                    
                                    Text("***378")
                                        .font(.customfont(.medium, fontSize: 16))
                                        .foregroundStyle(Color.secondaryText)
                                    
                                }
                            }
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                            .padding(.horizontal, 10)
                            
                            Spacer()
                                .frame(height: 60)
                            VStack{
                                
                                LineTextField(title: "Enter Name", placholder: "Please Enter Name", txt: $txtName)
                                
                                    .limitInputLength(value: $txtName, length: 20)
                                
                                    .textContentType(.name)
                                    .keyboardType(.namePhonePad)
                                    .focused($focusedField,equals: .name)
                                    .submitLabel(.next)
                                
                                    .padding(.bottom,8)
                                LineTextField(title: "Enter Mobile", placholder: "Please Enter Mobile", txt: $txtMob)
                                    .focused($focusedField,equals: .mobile)
                                    .limitInputLength(value: $txtMob, length: 20)
                                
                                    .textContentType(.name)
                                    .keyboardType(.namePhonePad)
                                    .submitLabel(.next)
                                
                                    .padding(.bottom,8)
                                
                                LineTextField(title: "Enter Address", placholder: "Please Enter Address", txt: $txtAddress)
                                    .focused($focusedField,equals: .address)
                                    .limitInputLength(value: $txtAddress, length: 20)
                                
                                    .textContentType(.name)
                                    .keyboardType(.namePhonePad)
                                    .submitLabel(.next)
                                
                                    .padding(.bottom,8)
                                
                            }
                            .padding(.horizontal, 10)
                            
                            RoundButton(title: "Submit Request") {
                                
                                showAlert.toggle()
                            }
                            .padding(.horizontal, 30)
                            .padding(.top,20)
                            
                            
                        }
                        .frame(maxHeight: .infinity)
                    }
                    

                    Spacer()
                    
                }
            
            .adaptsToKeyboard()  //For Keyboard Up Handling 
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden()
        .navigationBarHidden(true)
        .ignoresSafeArea()
        .onAppear{
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1){
               
                self.focusedField = .name
            }
         }
        .toolbar{
            
            ToolbarItemGroup(placement: .keyboard) {
                Button("Done"){
                    focusedField = nil
                    print("Done Click")
                }.tint(.cyan)
                
                Spacer()
                
                Button {
                    previous()
                } label: {
                    Image(systemName: "chevron.up")
                }.padding(.horizontal)
                
                Button {
                    next()
                } label: {
                    Image(systemName: "chevron.down")
                }.padding(.horizontal)
                
            }
        

        }
        .onSubmit {
            handleSubmitLabel()
        }
        .alert("Title", isPresented: $showAlert, actions: {
            Button("OK", role:.none, action: {})

        }, message: {
           
            Text("Data Saveed" )

        })
       
    }
}

private extension KeyboardUpwithTextFiedlDemo {
 
    //FocusField
    enum DemoField : Int, Hashable, CaseIterable{
        
        case name
        case mobile
        case address
       
       
      
    }
    
    
    func handleSubmitLabel(){
        
        switch focusedField {
            
        case .name :
            focusedField = .mobile
            
        case .mobile :
            focusedField = .address
            
       
        case .address :
            focusedField = nil
            
        
        
            
        default :
            print("Done")
            
            
        }
        
    }
}



private extension KeyboardUpwithTextFiedlDemo {
    
    

    
    func next(){
        
        guard let currentInput = focusedField,
              let lastIndex = DemoField.allCases.last?.rawValue else{return}
        
        
        let index = min(currentInput.rawValue + 1 , lastIndex )
        
        self.focusedField = DemoField(rawValue: index)
    }
    
    func previous(){
        
        guard let currentInput =  focusedField,
              let lastIndex = DemoField.allCases.first?.rawValue else{return}
        
        //max(-1,0 ) give = 0 so it will not go out of range
        let index = max(currentInput.rawValue - 1 , lastIndex )
      
        self.focusedField = DemoField(rawValue: index)
    }
}
#Preview {
    KeyboardUpwithTextFiedlDemo()
}
