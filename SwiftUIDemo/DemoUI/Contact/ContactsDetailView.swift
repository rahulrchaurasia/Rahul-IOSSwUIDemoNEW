//
//  ContactsDetailView.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 15/07/23.
//

import SwiftUI


struct ContactsDetailView: View {
    
    @StateObject private var vm = ContactViewModel()
    @State private var shouldShowCreateContact : Bool = false
    var body: some View {
    
            LazyVStack {
                
                HStack(alignment: .top){
                    
                    Spacer()
                    
                    Button {
                        shouldShowCreateContact.toggle()
                    } label: {
                      Image(systemName: "plus")
                            .padding()
                    }
                    .font(.title)

                }
                .frame(maxWidth: .infinity, alignment: .top)
               
        
                ContactsDetails()
              
               
            }
            .padding(.horizontal)
        
            .sheet(isPresented: $shouldShowCreateContact) {
                
                TextFieldDemo3{ contact in
                    
                    print("New Contact")
                    dump(contact)
                    
                }
                    
            }
        
       
    }
}

struct ContactsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContactsDetailView()
    }
}
