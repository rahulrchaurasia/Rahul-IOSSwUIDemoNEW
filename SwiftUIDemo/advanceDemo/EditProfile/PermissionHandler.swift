//
//  PermissionHandler.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 29/06/24.
//

import Foundation


import SwiftUI
import Photos
import AVFoundation

class PermissionHandler: ObservableObject {
    
    @Published var cameraAuthorizationStatus: AVAuthorizationStatus = .notDetermined
    @Published var photoLibraryAuthorizationStatus: PHAuthorizationStatus = .notDetermined
    
    init() {
        updateCameraAuthorizationStatus()
        updatePhotoLibraryAuthorizationStatus()
    }
    
    // Checks the camera permission
    @MainActor func checkCameraPermission() async {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            cameraAuthorizationStatus = .authorized
        case .notDetermined:
            let granted = await AVCaptureDevice.requestAccess(for: .video)
            cameraAuthorizationStatus = granted ? .authorized : .denied
        case .denied:
            cameraAuthorizationStatus = .denied
        case .restricted:
            cameraAuthorizationStatus = .restricted
        @unknown default:
            break
        }
    }
    
    // Checks the photo library permission
    @MainActor func checkPhotoLibraryPermission() async {
        switch PHPhotoLibrary.authorizationStatus(for: .readWrite) {
        case .authorized:
            photoLibraryAuthorizationStatus = .authorized
        case .limited:
            photoLibraryAuthorizationStatus = .limited
        case .notDetermined:
            let status = await PHPhotoLibrary.requestAuthorization(for: .readWrite)
            photoLibraryAuthorizationStatus = status
        case .denied:
            photoLibraryAuthorizationStatus = .denied
        case .restricted:
            photoLibraryAuthorizationStatus = .restricted
        @unknown default:
            break
        }
    }
    
    // Updates the camera authorization status
    private func updateCameraAuthorizationStatus() {
        cameraAuthorizationStatus = AVCaptureDevice.authorizationStatus(for: .video)
    }
    
    // Updates the photo library authorization status
    private func updatePhotoLibraryAuthorizationStatus() {
        photoLibraryAuthorizationStatus = PHPhotoLibrary.authorizationStatus(for: .readWrite)
    }
    
    // Opens app settings for permission management
    func openAppSettings() {
        guard let url = URL(string: UIApplication.openSettingsURLString) else { return }
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
    
}
