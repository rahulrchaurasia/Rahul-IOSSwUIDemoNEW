//
//  QuickLookPreview.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 08/08/25.
//

import SwiftUI
import QuickLook
/*
 best and recommended way to view common file types like PDFs, images, and videos within your app is to use Apple's native QuickLook
 */

struct QuickLookPreview: View {
    
    // State to hold the URL of the file once downloaded.
    @State private var fileURL: URL?
    
    // State to control the presentation of the QuickLook sheet.
    @State private var showPreview = false
    
    // State to show a loading indicator during download.
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
            .buttonStyle(.borderedProminent)
            
        }
        // 2. Use a .sheet to present the preview modally.
        // This sheet is triggered when `showPreview` becomes true.
        .sheet(isPresented: $showPreview) {
            // Ensure we have a valid URL before trying to show the preview.
            // If the URL is valid, we present our custom QLPreview view.
            if let url = fileURL {
                QLPreview(url: url)
            }
        }
        .frame(width: 300, height: 100)
        .padding()
    }
    
    /// Downloads a sample PDF using async/await, saves it to a temporary
    /// local URL, and then triggers the preview.
    private func downloadAndPreviewPDF() {
        // Run the asynchronous download in a new Task.
        // UI updates are safe here because a Task initiated from a SwiftUI
        // view action inherits the @MainActor context.
        Task {
            isLoading = true
            // defer ensures isLoading is set to false when the scope is exited,
            // either on success or on error.
            defer { isLoading = false }

            guard let url = URL(string: "https://www.orimi.com/pdf-test.pdf") else {
                print("Invalid URL")
                return
            }
            
            do {
                // Await the download, which suspends this task but doesn't block the UI.
                let (tempURL, response) = try await URLSession.shared.download(from: url)
                
                // Create a permanent destination URL in the app's temporary directory.
                let destinationURL = FileManager.default.temporaryDirectory
                    .appendingPathComponent(response.suggestedFilename ?? "downloaded.pdf")
                
                // If a file already exists at the destination, remove it first.
                if FileManager.default.fileExists(atPath: destinationURL.path) {
                    try FileManager.default.removeItem(at: destinationURL)
                }
                
                // Move the downloaded file from its temporary location to our desired destination.
                try FileManager.default.moveItem(at: tempURL, to: destinationURL)
                
                // Update state to trigger the sheet presentation.
                self.fileURL = destinationURL
                self.showPreview = true
                
            } catch {
                // Handle any errors from the download or file operations.
                print("Download or file processing error: \(error.localizedDescription)")
            }
        }
    }
}

// MARK: - QuickLook UIViewControllerRepresentable

/// A UIViewControllerRepresentable struct that wraps a QLPreviewController.
/// This is the bridge between UIKit's QuickLook controller and SwiftUI.
struct QLPreview: UIViewControllerRepresentable {
    
    // The URL of the file to be previewed.
    let url: URL
    
    /// Creates the initial QLPreviewController.
    func makeUIViewController(context: Context) -> QLPreviewController {
        let controller = QLPreviewController()
        // The coordinator will handle the data source methods for the controller.
        controller.dataSource = context.coordinator
        return controller
    }
    
    /// This function is called when the state of the SwiftUI view changes,
    /// but we don't need to do anything here for this simple case.
    func updateUIViewController(_ uiViewController: QLPreviewController, context: Context) {
        // No update needed
    }
    
    /// Creates the coordinator instance that will act as the data source.
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    // MARK: - Coordinator
    
    /// The Coordinator class acts as the data source for the QLPreviewController.
    /// It provides the controller with the item(s) to preview.
    class Coordinator: NSObject, QLPreviewControllerDataSource {
        
        let parent: QLPreview
        
        init(parent: QLPreview) {
            self.parent = parent
        }
        
        /// Tells the controller how many items there are to preview.
        func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
            return 1
        }
        
        /// Provides the actual preview item (our URL) for a given index.
        func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
            // We cast our URL to a QLPreviewItem.
            return parent.url as QLPreviewItem
        }
    }
}


// MARK: - Preview

#Preview {
    QuickLookPreview()
}
