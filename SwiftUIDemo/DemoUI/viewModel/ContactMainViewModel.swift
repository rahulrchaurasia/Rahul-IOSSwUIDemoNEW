//
//  ContactMainViewModel.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 18/07/23.
//

import Foundation

final class ContactMainViewModel : ObservableObject {
    
    @Published private(set) var contacts : [NewContact] = []
    
    func addContact(_ contact : NewContact){
        
        contacts.append(contact)
    }
}
