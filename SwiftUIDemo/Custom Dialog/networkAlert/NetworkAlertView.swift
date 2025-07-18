//
//  NetworkAlertView.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 09/01/25.
//

import SwiftUI

struct NetworkAlertView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "wifi.slash")
                .font(.system(size: 50))
                .foregroundColor(.red)
            
            Text("No Internet Connection")
                .font(.title2)
                .bold()
            
            Text("Please check your internet connection and try again")
                .multilineTextAlignment(.center)
                .foregroundColor(.gray)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white)
                .shadow(radius: 10)
        )
        .padding()
    }
}

#Preview {
    NetworkAlertView()
}
