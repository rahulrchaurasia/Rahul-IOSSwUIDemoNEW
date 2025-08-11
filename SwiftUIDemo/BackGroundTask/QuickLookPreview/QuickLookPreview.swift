//
//  QuickLookPreview.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 08/08/25.
//

import SwiftUI
/*
 best and recommended way to view common file types like PDFs, images, and videos within your app is to use Apple's native QuickLook
 */

struct QuickLookPreview: View {
    
    @State private var fileURL: URL?
        @State private var isLoading = false
        
    
    var body: some View {
            VStack(spacing: 20) {
                if isLoading {
                    ProgressView("Downloading...")
                }
                Button("Download & Preview PDF") {
                    downloadAndPreviewPDF()
                }
                .disabled(isLoading)
            }
            // QuickLook modifier for native preview
            .quickLookPreview($fileURL)
            .frame(width: 300, height: 100)
            .padding()
        }
    
    
       private func downloadAndPreviewPDF() {
           isLoading = true
           guard let url = URL(string: "https://www.orimi.com/pdf-test.pdf") else {
               isLoading = false
               return
           }

           URLSession.shared.downloadTask(with: url) { tempURL, response, error in
               DispatchQueue.main.async {
                   isLoading = false
                   if let tempURL = tempURL {
                       // Save to temporary directory
                       let destURL = FileManager.default.temporaryDirectory
                           .appendingPathComponent("test.pdf")
                       try? FileManager.default.removeItem(at: destURL)
                       do {
                           try FileManager.default.moveItem(at: tempURL, to: destURL)
                           self.fileURL = destURL
                       } catch {
                           print("Error saving PDF:", error)
                       }
                   } else if let error = error {
                       print("Download error:", error)
                   }
               }
           }.resume()
       }
}

#Preview {
    QuickLookPreview()
}
