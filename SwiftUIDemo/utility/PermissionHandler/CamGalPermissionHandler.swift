//
//  CamGalPermissionHandler.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 03/07/24.
//

import Foundation

import SwiftUI
import AVFoundation
import PhotosUI

@MainActor
class CamGalPermissionHandler: ObservableObject {
    @Published var cameraAuthorizationStatus: AVAuthorizationStatus = .notDetermined
       @Published var photoLibraryAuthorizationStatus: PHAuthorizationStatus = .notDetermined
       @Published var showImagePicker = false
       @Published var image: UIImage?
       @Published var isCheckingPermissions = false
       @Published private(set) var cameraPermissionDenied = false
       @Published private(set) var photoLibraryPermissionDenied = false
       @Published var imagePickerSourceType: UIImagePickerController.SourceType = .camera

    func checkCameraPermission() async {
        isCheckingPermissions = true
        cameraAuthorizationStatus = AVCaptureDevice.authorizationStatus(for: .video)
        if cameraAuthorizationStatus == .notDetermined {
            cameraAuthorizationStatus = await AVCaptureDevice.requestAccess(for: .video) ? .authorized : .denied
        }
        cameraPermissionDenied = cameraAuthorizationStatus == .denied
        isCheckingPermissions = false
    }

    func checkPhotoLibraryPermission() async {
        isCheckingPermissions = true
        photoLibraryAuthorizationStatus = PHPhotoLibrary.authorizationStatus(for: .readWrite)
        if photoLibraryAuthorizationStatus == .notDetermined {
            photoLibraryAuthorizationStatus = await PHPhotoLibrary.requestAuthorization(for: .readWrite)
        }
        photoLibraryPermissionDenied = photoLibraryAuthorizationStatus == .denied
        isCheckingPermissions = false
    }

    func openAppSettings() {
        guard let settingsURL = URL(string: UIApplication.openSettingsURLString) else { return }
        UIApplication.shared.open(settingsURL)
    }

    func openCamera() async {
        await checkCameraPermission()
        if cameraAuthorizationStatus == .authorized {
            imagePickerSourceType = .camera
            showImagePicker = true
        }
    }

    func openGallery() async {
        await checkPhotoLibraryPermission()
        if photoLibraryAuthorizationStatus == .authorized || photoLibraryAuthorizationStatus == .limited {
            //showPhotoPicker = true
        }
    }
}


