//
//  CamGalleryAdvanced.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 29/06/24.
//

import SwiftUI

 
struct CamGalleryAdvanced: View {
    
    var data : String  = "test" // not used
    @StateObject private var viewModel = CamGalPermissionHandlerOld() // Use the combined handler

    @State private var image: UIImage?
   
    var body: some View {
        NavigationView {
                    VStack {
                        imageView
                        if viewModel.isCheckingPermissions {
                                            ProgressView("Checking permissions...")
                                        } else {
                                            HStack {
                                                accessButton(title: "Open Camera", color: .blue, action: viewModel.openCamera)
                                                accessButton(title: "Open Gallery", color: .green, action: viewModel.openGallery)
                                            }
                                            .padding()
                                        }
                    }
            
                    .sheet(isPresented: $viewModel.showImagePicker) {
                                    ImagePicker2(sourceType: viewModel.sourceType, selectedImage: $image)
                                }
                                .sheet(isPresented: $viewModel.showGalleryPicker) {
                                    ImagePicker2(sourceType: viewModel.sourceType, selectedImage: $image)
                                }
                                .alert("Permission Denied", isPresented: .constant(viewModel.cameraPermissionDenied || viewModel.photoLibraryPermissionDenied), actions: {
                                    Button("Go to Settings") {
                                        viewModel.openAppSettings()
                                    }
                                    Button("Cancel", role: .cancel) { }
                                }, message: {
                                    Text("Please enable Camera and Photo Library access in Settings.")
                                })
                                .navigationBarTitle("Camera & Gallery", displayMode: .inline)
                                .onAppear {
                                    Task {
                                        await viewModel.checkPermissions()
                                    }
                                }
                    
                }
            
    }
}

extension CamGalleryAdvanced{
    
    private var imageView: some View {
            Group {
                if let image = image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .cornerRadius(10)
                        .padding()
                } else {
                    Text("No Image Selected")
                        .font(.headline)
                        .padding()
                }
            }
        }
    
    private func accessButton(title: String, color: Color, action: @escaping () -> Void) -> some View {
            Button(action: action) {
                Text(title)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(color)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
}


    
//#Preview {
//    let permissionHandler = PermissionHandler()
//    CamGalleryAdvanced(permissionHandler: permissionHandler)
//}

struct CamGalleryAdvanced_Preview : PreviewProvider {
    static var previews: some View {
        
        //let permissionHandler = PermissionHandler()
        CamGalleryAdvanced()
     
    }
}
