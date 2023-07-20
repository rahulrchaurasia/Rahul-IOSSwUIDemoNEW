//
//  TextFieldDemo3.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 14/07/23.
//

/*
 Contact Create Demo
 We use Closure ie lemda expression for passing data from second page to firest page
 */
import SwiftUI

struct TextFieldDemo3: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.presentationMode)  var presentationMode
    @StateObject private var vm = ContactViewModel()
    
    @FocusState private var focusedInput : Field?
    //Closure DEfine : for passing Contact Entity
    let action :   (_ contact : NewContact) -> Void
    var body: some View {
        
        NavigationView {
          
            VStack{
                
                //contactToolBar
                Form {
                   
                    general
                    contact
                    emergency
                    otherDetails
                    clearAll
                }
                
            }
           
            .background(Color.orange.opacity(0.1))
            
            .navigationTitle("Add Contact")
            .toolbar {
                ToolbarItem( placement: .confirmationAction) {
                    
                    Button("Done") {
                        
                        print("Done")
                        action(vm.newConatct)
                        handleDismissAll()
                    }
                   .disabled(!vm.isvalid)
                    
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    
                    Button("Cancel") {
                        print("Cancel")
                        handleDismissAll()
                    }
                }
                
                ToolbarItemGroup(placement: .keyboard) {
                   
                    Spacer()
                    Button {
                        print("Previous Click")
                      previous()
                    } label: {
                      Image(systemName: "chevron.up")
                    }.padding(.trailing)

                    Button {
                        print("next Click")
                      next()
                    } label: {
                      Image(systemName: "chevron.down")
                    }.padding(.trailing)

                }

            }
            
            .onAppear{
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1){

                   // self.focusedInput = .prefix
                }
            }
        }
       
     
      
        
            
    }
}

struct TextFieldDemo3_Previews: PreviewProvider {
    static var previews: some View {
       // TextFieldDemo3()
        TextFieldDemo3{ _ in}
    }
}
private extension TextFieldDemo3 {
 
    enum Field : Int, Hashable, CaseIterable{
        
        case prefix
        case firstName
        case lastName
        case company
        case email
        case phoneNumber
       
        case emergencyNotes
        
        case address1
        case address2
        case address3
      
    }
}

private extension TextFieldDemo3 {
    
    
    
 
    func next(){
        
        guard let currentInput = focusedInput,
              let lastIndex = Field.allCases.last?.rawValue else{return}
        
        
        let index = min(currentInput.rawValue + 1 , lastIndex )
        //lastIndex = 6 our enum has emergencyNotes at 6 pos
       // min(1,6) = give 1
       //  but out of range ie(7,6) = give 6 so
        self.focusedInput = Field(rawValue: index)
    }
    
    func previous(){
        
        guard let currentInput = focusedInput,
              let lastIndex = Field.allCases.first?.rawValue else{return}
        
        //max(-1,0 ) give = 0 so it will not go out of range
        let index = max(currentInput.rawValue - 1 , lastIndex )
      
        self.focusedInput = Field(rawValue: index)
    }
}

private extension TextFieldDemo3 {
    
    var contactToolBar : some View {
        
        HStack{
            
            Button {
               print("Cancel")
                handleDismissAll()
            } label: {
                Text("Cancel")
                    .padding()
                    

            }
            
            

            Spacer()
            
            Button {
               print("Done")
                action(vm.newConatct)
                handleDismissAll()
            } label: {
                Text("Done")
                    .padding()
                  
               
            }
           
           

        } .foregroundColor(.blue)
            .font(.system(size: 18))
    }
    
    var general : some View {
        
        Section{
            
            TextField("Prefix", text: $vm.newConatct.general.prefix)
                .textContentType(.namePrefix)
                .focused($focusedInput, equals: .prefix)
               // . dismissKeyboardOnTap()
            
            TextField("First Name", text: $vm.newConatct.general.firstName)
                .textContentType(.name)
                .keyboardType(.namePhonePad)
                .focused($focusedInput, equals: .firstName)
                
            
            TextField("Last Name", text: $vm.newConatct.general.lastName)
                .textContentType(.familyName)
                .keyboardType(.namePhonePad)
                .focused($focusedInput,equals: .lastName)
              
            
            // Picker : Gender.allCases defines all cases of enum ie male,female,none
            Picker("Gender", selection: $vm.newConatct.general.gender) {
               
                ForEach(NewContact.General.Gender.allCases){ item in
                    
                    Text(item.rawValue.uppercased())
                        .font(.caption).background(Color.gray.opacity(0.7))
                    
                }
            }
            
           
            TextField("(Optional) Company", text: $vm.newConatct.general.company)
                .textContentType(.organizationName)
                .focused($focusedInput, equals: .company)
                
    
            
        }header: {
            Text("General")
        }footer: {
            Text("Please enter above info")
        }
    }
    
    var pickerDemo : some View {
        
        VStack{
            Picker("Gender wheel", selection: $vm.newConatct.general.gender) {
                
                ForEach(NewContact.General.Gender.allCases){ item in
                    
                    Text(item.rawValue.uppercased())
                        .font(.headline).background(Color.white)
                    
                }
            }.pickerStyle(.wheel)
            
            Picker("Gender menu", selection: $vm.newConatct.general.gender) {
                
                ForEach(NewContact.General.Gender.allCases){ item in
                    
                    Text(item.rawValue.uppercased())
                        .font(.headline).background(Color.white)
                    
                }
            }.pickerStyle(.menu)
            
            Picker("Gender inline", selection: $vm.newConatct.general.gender) {
                
                ForEach(NewContact.General.Gender.allCases){ item in
                    
                    Text(item.rawValue.uppercased())
                        .font(.headline).background(Color.white)
                    
                }
            }.pickerStyle(.inline)
            
            Picker("Gender segmented", selection: $vm.newConatct.general.gender) {
                
                ForEach(NewContact.General.Gender.allCases){ item in
                    
                    Text(item.rawValue.uppercased())
                        .font(.headline).background(Color.white)
                    
                }
            }.pickerStyle(.segmented)
        }
        
    }
    
    var contact : some View {
        
        Section{
            
            TextField("(Optional) Email ", text: $vm.newConatct.contactInfo.Email)
                .textContentType(.emailAddress)
                .keyboardType(.emailAddress)
                .focused($focusedInput, equals: .email)
            
            TextField("Phone Number", text: $vm.newConatct.contactInfo.phoneNumber)
                .textContentType(.telephoneNumber)
                .keyboardType(.phonePad)
                .focused($focusedInput,equals: .phoneNumber)
            
           
            
        }
      
    }
    
    var emergency : some View {
        
        Section{
            
            Toggle("Emegency Contact", isOn: $vm.newConatct.emergency.isEmegency)
            
            TextEditor(text: $vm.newConatct.emergency.notes)
                .focused($focusedInput, equals: .emergencyNotes)
        }footer: {
            Text("Please enter information of emegency contact info")
                
        }
    }
    
    var otherDetails : some View {
        
        Section{
            
            TextField("Address 1", text: $vm.newConatct.otherDetails.address1)
                .textContentType(.addressCity)
                .keyboardType(.phonePad)
                .focused($focusedInput,equals: .address1)
            
            TextField("Address 2 ", text: $vm.newConatct.otherDetails.address2)
                .textContentType(.emailAddress)
                .keyboardType(.emailAddress)
                .focused($focusedInput, equals: .address2)
            
            TextField("Address 3 ", text: $vm.newConatct.otherDetails.address3)
                .textContentType(.emailAddress)
                .keyboardType(.emailAddress)
                .focused($focusedInput, equals: .address3)
            
        }header: {
            Text("Other Details")
        }
      
    }
    
    var clearAll : some View {
        
//        Button("clear ALl", role: .destructive, action: {
//
//
//        })

        Button( role: .destructive) {
       
            withAnimation {
                vm.clearAll()
            }
        } label: {
           Text("Clear All")
        }


    }
}

private extension TextFieldDemo3 {
    
    func handleDismissAll(){
        
        if #available(iOS 15, *){
            dismiss()
        }else{
            presentationMode.wrappedValue.dismiss()
        }
    }
}
