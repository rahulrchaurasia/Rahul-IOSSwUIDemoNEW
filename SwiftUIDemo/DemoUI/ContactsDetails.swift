//
//  ContactsDetails.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 15/07/23.
//

import SwiftUI

struct ContactsDetails: View {
    var body: some View {
        
        VStack(alignment: .leading, spacing: 15) {
            
            Text("Mr. Rahul")
                .font(.title3)
                .bold()
            
            Text("**Gender**: Male")
            Text("**Company** TechInfo")
            
            Divider()
            
                
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
                    
                } label: {
                    Image(systemName: "chevron.down")
                        .symbolVariant(.circle.fill)
                    
                }
                .font(.title)
                .foregroundStyle(.gray.opacity(0.5))
                
            }
            
            Text("Some emergecy information here")
            
        }
        .padding()
        .background(.gray.opacity(0.1),in : RoundedRectangle(cornerRadius: 12, style: .continuous))

        
    }
}

struct ContactsDetails_Previews: PreviewProvider {
    static var previews: some View {
        ContactsDetails()
            .previewLayout(.sizeThatFits)
    }
}
