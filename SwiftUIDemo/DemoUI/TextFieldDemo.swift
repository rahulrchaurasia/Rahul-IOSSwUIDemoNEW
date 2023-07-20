//
//  TextFieldDemo.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 27/03/23.
//

import SwiftUI


struct TextFieldDemo: View {
    
   
    enum registerField  : Int, Hashable, CaseIterable {
        

        case firstname
        case lname
        case mob
        case address
        case permAddress
      
    }
   
    @State private var firstname = String()
    @State private var lname = String()
    @State private var mob = String()
    @State private var address = String()
    @State private var permAddress = String()
   
    
    
    @State private var isSecure = Bool()
    
    @FocusState private var fieldInFocus : registerField?
    var body: some View {
        
        //let bg = Color(#colorLiteral(red: 0.7764705882, green: 0.7764705882, blue: 0.7843137255, alpha: 0.2887779388))
        ZStack{
            Color(.white)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            ScrollView{
                VStack{
                    
                    
                    
                    Text("TextField Demo")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.brown)
                    
                    
                    VStack(alignment: .leading, spacing: 16){
                        
                        
                        CustomFieldText(name: $firstname, label: "Enter Fname")
                      
                        VStack(alignment: .leading, spacing: 5) {
                            LabelView(labelValue: "Enter First Name:")
                            TextField("Enter First Name", text: $firstname)
                                .focused( $fieldInFocus , equals: .firstname)
                                .font(.title2)
                                .padding(15)
                                .frame(height: 55)
                                .frame(maxWidth: .infinity)
                                .background(Color("textbg"))
                                .cornerRadius(12)
                                .submitLabel(.next)
                                .onSubmit {
                                    fieldInFocus = .lname
                                }
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            LabelView(labelValue: "Enter Last Name:")
                            TextField("Enter Last Name", text: $lname)
                                .focused( $fieldInFocus , equals: .lname)
                                .font(.title2)
                                .padding(15)
                                .frame(height: 55)
                                .frame(maxWidth: .infinity)
                                .background(Color("textbg"))
                                .cornerRadius(12)
                                .submitLabel(.next)
                                .onSubmit {
                                    fieldInFocus = .mob
                                }
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            LabelView(labelValue: "Enter Mobile No:")
                            TextField("Enter Mobile", text: $mob)
                                .focused( $fieldInFocus , equals: .mob)
                                .font(.title2)
                                .padding(15)
                                .frame(height: 55)
                                .frame(maxWidth: .infinity)
                                .background(Color("textbg"))
                                .cornerRadius(12)
                                .submitLabel(.next)
                                .onSubmit {
                                    fieldInFocus = .address
                                }
                        }
                        VStack(alignment: .leading, spacing: 5) {
                            LabelView(labelValue: "Enter Address:")
                            TextField("Enter Address", text: $address)
                                .focused( $fieldInFocus , equals: .address)
                                .font(.title2)
                                .padding(15)
                                .frame(height: 55)
                                .frame(maxWidth: .infinity)
                                .background(Color("textbg"))
                                .cornerRadius(12)
                                .submitLabel(.next)
                                .onSubmit {
                                    fieldInFocus = .permAddress
                                }
                        }
                        VStack(alignment: .leading, spacing: 5) {
                            LabelView(labelValue: "Enter Permanant Address:")
                            TextField("Enter Permanant Address", text: $permAddress)
                                .focused( $fieldInFocus , equals: .permAddress)
                                .font(.title2)
                                .padding(15)
                                .frame(height: 55)
                                .frame(maxWidth: .infinity)
                                .background(Color("textbg"))
                                .cornerRadius(12)
                                .submitLabel(.done)
                                .onSubmit {
                                   // fieldInFocus = .permAddress
                                    print("Permanent Address")
                                }
                        }
                       
                    }
                    .padding(.horizontal,20)
                    .padding(.top,20)
                    
                   
                     //Button
                    VStack (alignment: .center){
                        Button(action: {
                           
                            print("Done")
                            self.hideKeyboard()
                            //validation()
                        }) {
                            Text("Submit")
                        }
                        .padding(20)
                        
                        .foregroundColor(.white)
                        .background(Color.purple)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    }.padding(.top)

                    
                    
                    Spacer()
                    
                }
            }
           
        }
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
               
                Spacer()
                Button {
                    print("Previous Click")
                  previous()
                } label: {
                  Image(systemName: "chevron.up")
                }.padding(.horizontal)

                Button {
                    print("next Click")
                  next()
                } label: {
                  Image(systemName: "chevron.down")
                }.padding(.horizontal)

            }
        }
       
     
     
    }
    
    func  validation(){
        
        if firstname.isEmpty{
            
            fieldInFocus = .firstname
        }else if lname.isEmpty {
            
            fieldInFocus = .lname
        }else if mob.isEmpty {
            
            fieldInFocus = .mob
        }else if address.isEmpty {
            
            fieldInFocus = .address
        }else if permAddress.isEmpty {
            
            fieldInFocus = .permAddress
        }
        
    }
}

private extension TextFieldDemo {
    
    
    
 
    func next(){
        
        guard let currentInput = fieldInFocus,
              let lastIndex = registerField.allCases.last?.rawValue else{return}
        
        
        let index = min(currentInput.rawValue + 1 , lastIndex )
        
        self.fieldInFocus = registerField(rawValue: index)
    }
    
    func previous(){
        
        guard let currentInput = fieldInFocus,
              let lastIndex = registerField.allCases.first?.rawValue else{return}
        
        //max(-1,0 ) give = 0 so it will not go out of range
        let index = max(currentInput.rawValue - 1 , lastIndex )
      
        self.fieldInFocus = registerField(rawValue: index)
    }
}
struct TextFieldDemo_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldDemo()
    }
}

