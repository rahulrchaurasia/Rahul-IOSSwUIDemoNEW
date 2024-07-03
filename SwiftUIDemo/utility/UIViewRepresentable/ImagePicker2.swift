//
//  ImagePickerAdvance.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 29/06/24.
//

import Foundation
import SwiftUI

struct ImagePicker2  : UIViewControllerRepresentable {
    
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
        @Binding var selectedImage: UIImage?
    @Environment(\.presentationMode) var presentationMode
        
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker2>) -> UIImagePickerController {
            let imagePicker = UIImagePickerController()
            imagePicker.sourceType = sourceType
            imagePicker.allowsEditing = true
            imagePicker.delegate = context.coordinator
            return imagePicker
        }

        func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker2>) {}

        func makeCoordinator() -> Coordinator {
            Coordinator(self)
        }
    
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
            let parent: ImagePicker2

            init(_ parent: ImagePicker2) {
                self.parent = parent
            }

            func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
                if let image = info[.originalImage] as? UIImage {
                    parent.selectedImage = image
                }
                //parent.presentationMode.wrappedValue.dismiss()
                picker.dismiss(animated: true)
                parent.presentationMode.wrappedValue.dismiss()
            }
        
          func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
              picker.dismiss(animated: true)
                    parent.presentationMode.wrappedValue.dismiss()
            }
        }

}
