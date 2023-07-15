//
//  ContactViewModel.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 14/07/23.
//

import Foundation

final class ContactViewModel : ObservableObject {
    
    @Published var newConatct : NewContact = .empty
    
    var isvalid : Bool {
        
        !newConatct.general.prefix.isEmpty &&
        !newConatct.general.firstName.isEmpty &&
        !newConatct.general.lastName.isEmpty &&
        
        !newConatct.contactInfo.phoneNumber.isEmpty
        
    }
    
    func clearAll() {
        self.newConatct = .empty
    }
    
    
}
