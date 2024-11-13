//
//  CamGalleryDem2.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 29/04/24.
//

import SwiftUI

//Note : CamGalleryDem2
struct CamGalleryDem2: View {
    
    @State private var selectedImage: UIImage?
    @State private var isPresentingPicker = false
    
    var body: some View {
        
        VStack {
                    if let image = selectedImage {
                        Image(uiImage: image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200, height: 200)
                            .padding()
                    } else {
                        Button("Select Image") {
                            isPresentingPicker.toggle()
                        }
                        .padding()
                        .sheet(isPresented: $isPresentingPicker) {
                            PHPickerView(selectedImage: $selectedImage)
                        }
                    }
                }
    }
}

#Preview {
    CamGalleryDem2()
}
