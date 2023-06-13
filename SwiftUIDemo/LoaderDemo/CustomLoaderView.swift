//
//  CustomLoaderView.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 13/06/23.
//

import SwiftUI

struct CustomLoaderView: View {
    @Binding var isLoading: Bool
    var body: some View {
        if isLoading {
                    ZStack {
                        Color.black.opacity(0.4)
                            .edgesIgnoringSafeArea(.all)
                        
                        VStack {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                                .scaleEffect(1.5) // Customize the size of the progress indicator
                            
                            Text("Loading...")
                                .foregroundColor(.white)
                                .font(.headline) // Customize the font style
                                .padding(.top, 8)
                        }
                        .padding(16)
                        .background(Color.gray)
                        .cornerRadius(8)
                        .animation(.easeInOut) // Add animation to the loader appearance
                        .transition(.scale) // Add a transition when the loader appears or disappears
                    }
                }
    }
}

struct CustomLoaderView_Previews: PreviewProvider {
    static var previews: some View {
       
        CustomLoaderView(isLoading: .constant(true))
    }
}
