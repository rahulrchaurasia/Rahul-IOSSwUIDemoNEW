//
//  ContactsDetailView.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 15/07/23.
//

import SwiftUI

/*
 
 https://stackoverflow.com/questions/59702997/can-a-modal-sheet-have-a-navigation-bar-in-swiftui
 
 For Sheet : Navigation Bar does not appear in the modal sheet as you can see below.
 wrap your modal view in a NavigationView like this
 .sheet(isPresented: $isModalSheetShown) {
         NavigationView {
             VStack {
                 Text("Modal")
             }
             .navigationBarItems(trailing: Button("Done",
                                                  action: {}))
         }
     }
 
 Note : We Manually Add Title and
 remove BackButton from toolbar using .navigationBarBackButtonHidden(true)
 
 */
struct ContactsDetailView: View {
    
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.presentationMode) private var presentationMode
    @StateObject private var vm = ContactMainViewModel()
    @State private var shouldShowCreateContact : Bool = false
    var body: some View {
    
           VStack {
                
                HStack(alignment: .top){
                    
                    Spacer()
                    
                    Button {
                        print("Done")
                    } label: {
                      Image(systemName: "person.fill.checkmark")
                            .padding()
                    }
                    .font(.title)

                }
                .frame(maxWidth: .infinity, alignment: .top)
               /******************************************/
                    // Contact Data display Here
                
                if(vm.contacts.isEmpty){
                    
                    Text("No Contact Added...")
                        .font(.headline)
                        .padding(20)
                        .foregroundColor(.blue)
                        .background(.gray.opacity(0.3))
                }else{
                    ScrollView(.vertical, showsIndicators: false){
                        LazyVStack {
                            ForEach(vm.contacts) { item in
                                ContactsDetails(item: item)
                            }
                            
                        }
                    }
                    
                   
                }
                   
                    
                /******************************************/
               
            }
            .background(.white)
            .padding(.horizontal)
        
            .sheet(isPresented: $shouldShowCreateContact) {
                
                TextFieldDemo3{ contact in
                    
                    print("New Contact")
                    dump(contact)
                    /*
                     dump function is used to print a detailed description of a value, including its structure and nested properties. 
                     */
                    vm.addContact(contact)
                    
                }
              
                    
            }
        
            .navigationTitle("Contact DEmo")
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading:
                    Button(action: {
                       
                      handleDismissAll()
                    }) {
                        HStack {
                            Image(systemName: "chevron.left")
                                .resizable()
                                .font(.title2)
                           // Text("Custom Back")
                        }
                    }
                )
            .toolbar {
                
                
                //                ToolbarItem(placement: .navigationBarTrailing) {
                //
                //                    Button {
                //                        //moveToHome()
                //                        print("Move To Home")
                //                    } label: {
                //
                //                       Image(systemName: "house.fill")
                //                    }
                //
                //                }
                
                
            
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    
                    Button {
                        
                        shouldShowCreateContact.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20)
                    }
                    Button {
                        moveToHome()
                        print("Move To Home")
                    } label: {
                        
                        Image(systemName: "house.fill")
                    }
                    
                    
                }
                
                ToolbarItem(placement: .principal) {
                    Text("Contact")
                        .font(.headline)
                }
            }
    }
}


private extension ContactsDetailView {
    
    func handleDismissAll(){
        
        if #available(iOS 15, *){
            
            dismiss()
        }else{
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func moveToHome(){
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                let windows = windowScene.windows
                windows.forEach { window in
                    window.rootViewController?.dismiss(animated: true, completion: nil)
                }
            }
    }
}
struct ContactsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContactsDetailView()
    }
}
