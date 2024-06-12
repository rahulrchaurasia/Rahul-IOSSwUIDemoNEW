//
//  PickerDEmo.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 27/09/23.
//

import SwiftUI


enum Gender: String, CaseIterable, Identifiable {
    case male = "Male"
    case female = "Female"
    case other = "Other"
    
    var id: String { self.rawValue }
}


struct PickerDEmo: View {
    
    @State private var selectedGender : Gender = .male
    @State private static var address: String = ""
    
   
    var body: some View {
        
        VStack
        {
            Picker("Selction Gender", selection: $selectedGender) {
                ForEach(Gender.allCases, id: \.self ) { gender in
                    
                    Text(gender.rawValue)
                }
                
            }
            .padding(.horizontal,10)
            .padding(8)
            .background {
                Color.green.opacity(0.3)
                    .cornerRadius(10)
                   
            }
            
            Text("Selected Gender: \(selectedGender.id)")
            
            

            
        }
        
    }
}

struct PickerDEmo_Previews: PreviewProvider {
    static var previews: some View {
        PickerDEmo()
    }
}


