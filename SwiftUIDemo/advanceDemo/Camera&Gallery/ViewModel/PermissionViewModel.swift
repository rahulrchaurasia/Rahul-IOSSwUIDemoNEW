//
//  PermissionViewModel.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 30/04/24.
//

import Foundation
import AVFoundation
import UIKit
import Photos


 class PermissionViewModel : ObservableObject {
    
    @Published var isShowingPhotoPicker = false
    @Published var isShowingCameraPicker = false
       
    @Published var isShowingAlert = false
      var alertTitle = ""
      var alertMessage = ""
    
   

    
    func requestCameraPermission() {
        AVCaptureDevice.requestAccess(for: .video) { [weak self] granted in
            DispatchQueue.main.async {
                guard let self = self else { return }
                if granted {
                    self.isShowingCameraPicker = true
                    self.isShowingPhotoPicker = false
                } else {
                    self.showAlert(title: "Permission Denied", message: "Please grant camera permission in Settings to use this feature.")
                }
            }
        }
    }
     
     //Mark : Using Async await
     func requestCameraPermissionOther() async -> Bool {
             let granted = await AVCaptureDevice.requestAccess(for: .video)
             return granted
         }
    
    func requestPhotoLibraryPermission() {
        PHPhotoLibrary.requestAuthorization { [weak self] status in
            DispatchQueue.main.async {
                guard let self = self else { return }
                if status == .authorized {
                    self.isShowingPhotoPicker = true
                    self.isShowingCameraPicker = false
                } else {
                    self.showAlert(title: "Permission Denied", message: "Please grant photo library permission in Settings to use this feature.")
                }
            }
        }
    }
    
    func showAlert(title: String, message: String) {
        alertTitle = title
        alertMessage = message
        isShowingAlert = true
    }
    
    func openAppSettings() {
        guard let settingsURL = URL(string: UIApplication.openSettingsURLString),
              UIApplication.shared.canOpenURL(settingsURL) else { return }
        UIApplication.shared.open(settingsURL)
    }
    
   
}
