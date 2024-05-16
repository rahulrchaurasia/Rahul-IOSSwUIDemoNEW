//
//  RoundButton.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 19/12/23.
//

import SwiftUI

struct RoundButton: View {
    @State var title: String = "Tittle"
    var didTap: (()->())?
    
    var body: some View {
        Button {
            didTap?()
        } label: {
            Text(title)
                .font(.customfont(.semibold, fontSize: 18))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
        }
        .frame( minWidth: 0, maxWidth: .infinity, minHeight: 50, maxHeight: 50 )
        .background( Color.primaryApp)
        .cornerRadius(20)
    }
}
#Preview {
    
        RoundButton()
            .padding(20)
    
}
