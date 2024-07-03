//
//  CamGalleryViewModel.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 02/07/24.
//

import Foundation
import UIKit


class CamGalleryViewModel : ObservableObject {
        
    
    @Published var showImagePicker = false
        @Published var showGalleryPicker = false
        @Published var image: UIImage?
        @Published var sourceType: UIImagePickerController.SourceType = .camera
        @Published var isCheckingPermissions = true
        
        @Published private(set) var cameraPermissionDenied = false
        @Published private(set) var photoLibraryPermissionDenied = false
        
        private var permissionHandler: PermissionHandler

    
    
   // let permissionHandler: PermissionHandler
    
   
    init(permissionHandler: PermissionHandler) {
            self.permissionHandler = permissionHandler
            Task {
                await checkPermissions()
            }
        }
    
    func checkPermissions() async {
            await permissionHandler.checkCameraPermission()
            await permissionHandler.checkPhotoLibraryPermission()
            isCheckingPermissions = false
        }

    @MainActor private func updatePermissionStatus() {
           cameraPermissionDenied = permissionHandler.cameraAuthorizationStatus == .denied
           photoLibraryPermissionDenied = permissionHandler.photoLibraryAuthorizationStatus == .denied
       }
      
    
    @MainActor func openCamera() {
           sourceType = .camera
           switch permissionHandler.cameraAuthorizationStatus {
           case .authorized:
               showImagePicker = true
           case .notDetermined:
               Task {
                   await permissionHandler.checkCameraPermission()
                   if permissionHandler.cameraAuthorizationStatus == .authorized {
                       showImagePicker = true
                   }
                   updatePermissionStatus()
               }
           case .denied, .restricted:
               cameraPermissionDenied = true
           @unknown default:
               break
           }
       }
    
    
    @MainActor func openGallery() {
        sourceType = .photoLibrary
        switch permissionHandler.photoLibraryAuthorizationStatus {
        case .authorized, .limited:
            showGalleryPicker = true
        case .notDetermined:
            Task {
                await permissionHandler.checkPhotoLibraryPermission()
                if permissionHandler.photoLibraryAuthorizationStatus == .authorized || permissionHandler.photoLibraryAuthorizationStatus == .limited {
                    showGalleryPicker = true
                }
                updatePermissionStatus()
            }
        case .denied, .restricted:
            photoLibraryPermissionDenied = true
        @unknown default:
            break
        }
    }
    
    @MainActor func openAppSettings() {
        permissionHandler.openAppSettings()
    }
}
