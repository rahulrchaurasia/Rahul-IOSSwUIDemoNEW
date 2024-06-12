//
//  dropDownViewModel.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 28/05/24.
//

import Foundation


struct Zone: Identifiable {
    let id: Int
    let name: String
    let additionalField1: String
    let additionalField2: String
    let additionalField3: String
}
class dropDownViewModel : ObservableObject {
    
    @Published var zoneArr: [Zone] = []
      @Published var selectZone: Zone? = nil

    
    init() {
            // Initialize with some dummy data
        
           zoneArr.removeAll()
            zoneArr = [
                Zone(id: 1, name: "Zone 1", additionalField1: "Field1", additionalField2: "Field2", additionalField3: "Field3"),
                Zone(id: 2, name: "Zone 2", additionalField1: "Field1", additionalField2: "Field2", additionalField3: "Field3"),
                Zone(id: 3, name: "Zone 3", additionalField1: "Field1", additionalField2: "Field2", additionalField3: "Field3"),
                
                Zone(id: 4, name: "Zone 4", additionalField1: "Field1", additionalField2: "Field2", additionalField3: "Field3"),
                Zone(id: 5, name: "Zone 5", additionalField1: "Field1", additionalField2: "Field2", additionalField3: "Field3"),
                Zone(id: 6, name: "Zone 6", additionalField1: "Field1", additionalField2: "Field2", additionalField3: "Field3"),
                
                
                Zone(id: 7, name: "Zone 7", additionalField1: "Field1", additionalField2: "Field2", additionalField3: "Field3"),
                Zone(id: 8, name: "Zone 8", additionalField1: "Field1", additionalField2: "Field2", additionalField3: "Field3"),
                Zone(id: 9, name: "Zone 9", additionalField1: "Field1", additionalField2: "Field2", additionalField3: "Field3"),
                
                Zone(id: 10, name: "Zone 10", additionalField1: "Field1", additionalField2: "Field2", additionalField3: "Field3"),
                Zone(id: 11, name: "Zone 11", additionalField1: "Field1", additionalField2: "Field2", additionalField3: "Field3"),
                Zone(id: 12, name: "Zone 12", additionalField1: "Field1", additionalField2: "Field2", additionalField3: "Field3")
            
            ]
        }
}
