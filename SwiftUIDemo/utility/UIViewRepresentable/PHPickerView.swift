//
//  PHPickerViewControllerWrapper.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 29/04/24.
//

import Foundation
import SwiftUI
import PhotosUI


struct PHPickerView : UIViewControllerRepresentable {
    
    @Binding var selectedImages: UIImage
    
    
    func makeUIViewController(context: Context) -> PHPickerViewController {
            var configuration = PHPickerConfiguration()
            configuration.filter = .images
            configuration.selectionLimit = 1 // Set the maximum number of photos allowed to be selected
            let picker = PHPickerViewController(configuration: configuration)
            picker.delegate = context.coordinator
            return picker
        }

        func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {}

        func makeCoordinator() -> Coordinator {
            return Coordinator(parent: self)
        }
    
    
   
    class Coordinator: NSObject, PHPickerViewControllerDelegate {
            let parent: PHPickerView

            init(parent: PHPickerView) {
                self.parent = parent
            }

            func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
                picker.dismiss(animated: true)

                guard let result = results.first else {
                    return
                }

                result.itemProvider.loadObject(ofClass: UIImage.self) { (image, error) in
                    if let image = image as? UIImage {
                        DispatchQueue.main.async {
                            parent.selectedImage = image
                        }
                    }
                }
            }
        }
}
