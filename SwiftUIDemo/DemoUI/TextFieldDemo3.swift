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
    
    //Closure DEfine : for passing Contact Entity
    let action :   (_ contact : NewContact) -> Void
    var body: some View {
        VStack{
            
            contactToolBar
            Form {
               
                general
                contact
                emergency
                clearAll
            }
            
            Spacer()
        }
     
        .background(Color.gray.opacity(0))
        .navigationTitle("Add Contact")
            
    }
}

struct TextFieldDemo3_Previews: PreviewProvider {
    static var previews: some View {
       // TextFieldDemo3()
        TextFieldDemo3{ _ in}
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
                    .background(Color.green)

            }
            
            

            Spacer()
            
            Button {
               print("Done")
                action(vm.newConatct)
                handleDismissAll()
            } label: {
                Text("Done")
                    .padding()
                    .background(Color.green)
               
            }
           
           

        } .foregroundColor(.blue)
            .font(.system(size: 18))
    }
    
    var general : some View {
        
        Section{
            
            TextField("Prefix", text: $vm.newConatct.general.firstName)
                .textContentType(.namePrefix)
            
            TextField("First Name", text: $vm.newConatct.general.firstName)
                .textContentType(.name)
                .keyboardType(.namePhonePad)
            
            TextField("Last Name", text: $vm.newConatct.general.lastName)
                .textContentType(.familyName)
                .keyboardType(.namePhonePad)
            
            // Picker : Gender.allCases defines all cases of enum ie male,female,none
            Picker("Gender", selection: $vm.newConatct.general.gender) {
               
                ForEach(NewContact.General.Gender.allCases){ item in
                    
                    Text(item.rawValue.uppercased())
                        .font(.caption).background(Color.gray.opacity(0.7))
                    
                }
            }
            
           
            TextField("(Optional) Company", text: $vm.newConatct.general.company)
                .textContentType(.organizationName)
            
    
            
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
            
            TextField("Phone Number", text: $vm.newConatct.contactInfo.phoneNumber)
                .textContentType(.telephoneNumber)
                .keyboardType(.phonePad)
            
            TextField("(Optional) Email ", text: $vm.newConatct.contactInfo.Email)
                .textContentType(.emailAddress)
                .keyboardType(.emailAddress)
        }
      
    }
    
    
    var emergency : some View {
        
        Section{
            
            Toggle("Emegency Contact", isOn: $vm.newConatct.emergency.isEmegency)
            
            TextEditor(text: $vm.newConatct.emergency.notes)
        }footer: {
            Text("Please enter information of emegency contact info")
                
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
