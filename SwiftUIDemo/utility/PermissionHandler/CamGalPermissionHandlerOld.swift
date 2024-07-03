//
//  CamGalPermissionHandler.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 02/07/24.
//

import Foundation
import SwiftUI
import AVFoundation
import Photos
// Combined PermissionHandler and ViewModel
@MainActor
class CamGalPermissionHandlerOld: ObservableObject {
    @Published var cameraAuthorizationStatus: AVAuthorizationStatus = .notDetermined
    @Published var photoLibraryAuthorizationStatus: PHAuthorizationStatus = .notDetermined
    @Published var showImagePicker = false
    @Published var showGalleryPicker = false
    @Published var image: UIImage?
    @Published var sourceType: UIImagePickerController.SourceType = .camera
    @Published var isCheckingPermissions = true
    @Published private(set) var cameraPermissionDenied = false
    @Published private(set) var photoLibraryPermissionDenied = false
    
    init() {
        Task {
            await checkPermissions()
        }
    }
    
    func checkPermissions() async {
        await checkCameraPermission()
        await checkPhotoLibraryPermission()
        isCheckingPermissions = false
        updatePermissionStatus()
    }
    
    private func updatePermissionStatus() {
        cameraPermissionDenied = cameraAuthorizationStatus == .denied
        photoLibraryPermissionDenied = photoLibraryAuthorizationStatus == .denied
    }
    
    func checkCameraPermission() async {
        cameraAuthorizationStatus = AVCaptureDevice.authorizationStatus(for: .video)
        if cameraAuthorizationStatus == .notDetermined {
            cameraAuthorizationStatus = await requestCameraPermission()
        }
    }
    
    func requestCameraPermission() async -> AVAuthorizationStatus {
        await withCheckedContinuation { continuation in
            AVCaptureDevice.requestAccess(for: .video) { granted in
                continuation.resume(returning: granted ? .authorized : .denied)
            }
        }
    }
    
    func checkPhotoLibraryPermission() async {
        photoLibraryAuthorizationStatus = PHPhotoLibrary.authorizationStatus(for: .readWrite)
        if photoLibraryAuthorizationStatus == .notDetermined {
            photoLibraryAuthorizationStatus = await requestPhotoLibraryPermission()
        }
    }
    
    func requestPhotoLibraryPermission() async -> PHAuthorizationStatus {
        await withCheckedContinuation { continuation in
            PHPhotoLibrary.requestAuthorization(for: .readWrite) { status in
                continuation.resume(returning: status)
            }
        }
    }
    
    func openAppSettings() {
        guard let settingsURL = URL(string: UIApplication.openSettingsURLString) else { return }
        UIApplication.shared.open(settingsURL)
    }
    
    // Methods to handle Camera and Gallery actions
    func openCamera() {
        sourceType = .camera
        switch cameraAuthorizationStatus {
        case .authorized:
            showImagePicker = true
            showGalleryPicker = false
        case .notDetermined:
            Task {
                await checkCameraPermission()
                if cameraAuthorizationStatus == .authorized {
                    showImagePicker = true
                    showGalleryPicker = false
                }
                updatePermissionStatus()
            }
        case .denied, .restricted:
            cameraPermissionDenied = true
        @unknown default:
            break
        }
    }
    
    func openGallery() {
        sourceType = .photoLibrary
        switch photoLibraryAuthorizationStatus {
        case .authorized, .limited:
            showGalleryPicker = true
            showImagePicker = false
        case .notDetermined:
            Task {
                await checkPhotoLibraryPermission()
                if photoLibraryAuthorizationStatus == .authorized || photoLibraryAuthorizationStatus == .limited {
                    showGalleryPicker = true
                    showImagePicker = false
                }
                updatePermissionStatus()
            }
        case .denied, .restricted:
            photoLibraryPermissionDenied = true
        @unknown default:
            break
        }
    }
}
