//
//  NewContact.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 14/07/23.
//

import Foundation

// Note : No need to create nested struct here
// this is done because of increase read- ability.
struct NewContact : Identifiable {
    let id = UUID()

    var general : General
    var contactInfo : ContactInfo
    var emergency : Emergency
    var otherDetails : OtherDetails
}

extension NewContact{
    
    struct General {
        
        var prefix : String
        var gender : Gender
        var firstName : String
        var lastName : String
        var company : String
         
       
    }
}

extension NewContact.General {
    
    // Note : we can add also in Picker {eg TextFieldDemo3}
    enum Gender : String ,Identifiable,CaseIterable {
       
        var id : Self {self}
        
        case male
        case female
        case no = "No to say"
    }
}

extension NewContact{
    
    struct ContactInfo {
        
        var phoneNumber : String
        var Email : String
        
    }
}

extension NewContact{
    
    struct Emergency {
        
        var isEmegency : Bool
        var notes : String
        
    }
}

extension NewContact{
    
    struct OtherDetails {
        
        var address1 : String
        var address2 : String
        var address3 : String
        
    }
}

extension NewContact{
 
    static var empty : NewContact {
        
        let general = NewContact.General(prefix: "", gender: NewContact.General.Gender.allCases.first!, firstName: "", lastName: "", company: "")
        
        let contactInfo  = NewContact.ContactInfo(phoneNumber: "", Email: "")
        
        let emergency = NewContact.Emergency(isEmegency: false, notes: "")
        
        let otherDetails = NewContact.OtherDetails(address1: "", address2: "", address3: "")
        return NewContact(general: general, contactInfo: contactInfo, emergency: emergency, otherDetails: otherDetails)
        
        
    }
}
