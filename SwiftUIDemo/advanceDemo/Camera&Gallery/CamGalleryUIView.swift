//
//  CamGalleryUIView.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 28/04/24.
//

import SwiftUI
import AVFoundation
import Photos

struct CamGalleryUIView: View {

    
    var data : String  = "test" // not used
    @StateObject private var vm = PermissionViewModel()
   
    @State var profileImage: UIImage = UIImage(systemName: "person.fill")!
 
    
 //   @State private var sourceType: UIImagePickerController.SourceType = .camera
  
    
    @State private var isActionSheetShown = false
 
    var body: some View {
            ZStack {
                Button {
                    isActionSheetShown = true
                } label: {
                    Image(uiImage: profileImage ?? UIImage(systemName: "person.fill")!)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                        .foregroundStyle(.white)
                        .clipShape(Circle())
                }
                .frame(width: 100, height: 100)
                .background(Color.gray.opacity(0.25))
                .clipShape(Circle())
            }
            .confirmationDialog("Choose Option", isPresented: $isActionSheetShown, titleVisibility: .visible) {
                Button("Open Camera") {
                    vm.requestCameraPermission()
                }
                Button("Open Gallery") {
                    vm.requestPhotoLibraryPermission()
                }
                Button("Log Out", role: .destructive) {}
                Button("Cancel", role: .cancel) {}
            }
            .alert(isPresented: $vm.isShowingAlert) {
                Alert(title: Text(vm.alertTitle),
                      message: Text(vm.alertMessage),
                      dismissButton: .default(Text("Open Settings"), action: {
                    vm.openAppSettings()
                }))
            }
            .sheet(isPresented: $vm.isShowingPhotoPicker) {
                ImagePicker(selectedImage: $profileImage, sourceType: .photoLibrary)
            }
            .sheet(isPresented: $vm.isShowingCameraPicker) {
                ImagePicker(selectedImage: $profileImage, sourceType: .camera)
            }
        }
    
    
    

    private func openAppSettings1() {
            guard let settingsURL = URL(string: UIApplication.openSettingsURLString) else {
                return
            }
            
            if UIApplication.shared.canOpenURL(settingsURL) {
                UIApplication.shared.open(settingsURL)
            }
        }
    
    
    
}

#Preview {
    CamGalleryUIView()
}
