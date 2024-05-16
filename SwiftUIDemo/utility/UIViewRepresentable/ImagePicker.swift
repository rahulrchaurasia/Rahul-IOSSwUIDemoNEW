//
//  ImagePicker.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 28/04/24.
//

import Foundation
import SwiftUI

struct ImagePicker : UIViewControllerRepresentable {
    
       @Binding var selectedImage: UIImage
    var sourceType: UIImagePickerController.SourceType = .camera

       func makeUIViewController(context: Context) -> UIImagePickerController {
           let imagePicker = UIImagePickerController()
           imagePicker.sourceType = sourceType
           imagePicker.allowsEditing = true
           imagePicker.delegate = context.coordinator
           return imagePicker
       }

       func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
       }

       func makeCoordinator() -> Coordinator {
           Coordinator(self)
       }

    
    
   final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
            let parent: ImagePicker

            init(_ parent: ImagePicker) {
                self.parent = parent
            }

            func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
                if let image = info[.editedImage] as? UIImage {
                    parent.selectedImage = image
                }

                picker.dismiss(animated: true)
            }

            func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
                picker.dismiss(animated: true)
            }
        }
    
}
