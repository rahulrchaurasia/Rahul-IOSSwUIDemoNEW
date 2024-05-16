//
//  SupportProfile.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 06/05/24.
//

import SwiftUI


struct SupportProfile: View {
    
    let user : UserProfile
    var body: some View {
        HStack {
            
            Image("u1")
                .resizable()
                .scaledToFill()
                .cornerRadius(25)
                .frame(width: 50, height: 50)
                .clipped()
            
            VStack( spacing: 0) {
                
                HStack {
                    Text(user.name)
                        .font(.customfont(.bold, fontSize: 17))
                        .foregroundColor(.primaryText )
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                        
                    Text( user.createdDate)
                        .font(.customfont(.regular, fontSize: 13))
                        .foregroundColor(.secondaryText)
                    
                }
                
                HStack {
                    Text(user.message)
                        .font(.customfont(.regular, fontSize: 15))
                        .foregroundColor(.secondaryText )
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                    
                    if( user.baseCount.count > 0 ) {
                        Text( "\( user.baseCount )" )
                            .font(.customfont(.semibold, fontSize: 11))
                            .foregroundColor(.white)
                            .frame(minWidth: 65)
                            .padding(4)
                            .background( Color.primaryApp)
                            .cornerRadius(20)
                    }
                    
                    
                }
                
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
        .padding()
        .background(Color.white)
        
        .cornerRadius(10)
    }
}


struct SupportProfile_Previews: PreviewProvider {
    static var previews: some View {

        let user = UserProfile(id: 1, name: "Rahul",message: "Android Developer",baseCount: "34000Rs", createdDate: "2-Jan-2021")
          SupportProfile(user: user)
    }
}
