//
//  ContactsDetailView.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 15/07/23.
//

import SwiftUI

/*
 Note : We Manually Add Title and
 remove BackButton from toolbar using .navigationBarBackButtonHidden(true)
 */
struct ContactsDetailView: View {
    
    @StateObject private var vm = ContactViewModel()
    @State private var shouldShowCreateContact : Bool = false
    var body: some View {
    
            LazyVStack {
                
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
               /***************************/
                    // View is Here
                 ContactsDetails()
                /***************************/
               
            }
            .padding(.horizontal)
        
            .sheet(isPresented: $shouldShowCreateContact) {
                
                TextFieldDemo3{ contact in
                    
                    print("New Contact")
                    dump(contact)
                    
                }
                    
            }
        
            .navigationBarTitle("Contact DEmo")
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading:
                    Button(action: {
                       
                       print("Back press")
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
                    ToolbarItem(placement: .confirmationAction) {
                        Button {
                           
                            shouldShowCreateContact.toggle()
                        } label: {
                            Image(systemName: "plus")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20)
                        }
                    }
                
                ToolbarItem(placement: .principal) {
                                    Text("Contact")
                                        .font(.headline)
                                }
                }
    }
}

struct ContactsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContactsDetailView()
    }
}
