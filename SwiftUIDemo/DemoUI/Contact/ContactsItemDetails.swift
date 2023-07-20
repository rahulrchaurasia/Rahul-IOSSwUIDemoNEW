//
//  ContactsDetails.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 15/07/23.
//

import SwiftUI
/*
//Note This one is Seperate Item which we can use to pass in loop for
 multiple display.
 
 we must pass entity on the basis of that we can update all label eh
 */
struct ContactsDetails: View {
    
    let item : NewContact  //we have to pass from main View
    @State private var showEmergencyInfo : Bool = false // handling Locally..
    var body: some View {
        
        VStack(alignment: .leading, spacing: 15) {
            
            Text("\(item.general.prefix) \(item.general.firstName) \(item.general.lastName)" )
                .font(.title3)
                .bold()
            
            Text("**Gender**: \(item.general.gender.rawValue.uppercased())")
            Text("**Company** \(item.general.company)")
            
            Divider()
            
            Text("**Phone**: \(item.contactInfo.phoneNumber)")
            Text("**Email** \(item.contactInfo.Email)")
            
            Divider()
            
            if(item.emergency.isEmegency){
               
                HStack{
                    
                    Group{
                        
                        Image(systemName: "exclamationmark.octagon")
                            .symbolVariant(.fill)
                            .font(.title)
                        Text("Emergency Contact")
                            .font(.title2)
                            .bold()
                    }
                    .foregroundColor(.red)
                    
                    Spacer()
                   
                    
                    Button {
                        
                        withAnimation {
                            showEmergencyInfo.toggle()
                        }
                        
                    } label: {
                        Image(systemName: showEmergencyInfo ?"chevron.up" : "chevron.down")
                            .symbolVariant(.circle.fill)
                        
                    }
                    .font(.title)
                    .foregroundStyle(.gray.opacity(0.5))
                    
                }
                
                if(showEmergencyInfo){
                    
                    Text(item.emergency.notes)
                }
            }
           
           
            
        }
        .padding()
        .background(.gray.opacity(0.1),in : RoundedRectangle(cornerRadius: 12, style: .continuous))

        
    }
}

struct ContactsDetails_Previews: PreviewProvider {
    static var previews: some View {
        ContactsDetails(item: .empty)
            .previewLayout(.sizeThatFits)
    }
}
