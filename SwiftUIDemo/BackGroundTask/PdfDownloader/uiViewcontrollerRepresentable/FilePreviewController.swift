//
//  FilePreviewController.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 11/08/25.
//

import Foundation

import SwiftUI
import QuickLook

// This struct makes UIKit's QLPreviewController available to SwiftUI.
struct FilePreviewController: UIViewControllerRepresentable {
    
    // The URL of the file you want to preview (e.g., your downloaded PDF).
    let url: URL

    func makeUIViewController(context: Context) -> QLPreviewController {
        let controller = QLPreviewController()
        // The Coordinator will provide the file data to the controller.
        controller.dataSource = context.coordinator
        return controller
    }

    func updateUIViewController(_ uiViewController: QLPreviewController, context: Context) {
        // No updates needed for this view.
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }

    // The Coordinator acts as the data source for the QLPreviewController.
    class Coordinator: NSObject, QLPreviewControllerDataSource {
        let parent: FilePreviewController

        init(parent: FilePreviewController) {
            self.parent = parent
        }

        // Tells the preview controller we have exactly ONE file to show.
        func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
            return 1
        }

        // Provides the URL of that one file to the preview controller.
        func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
            return parent.url as QLPreviewItem
        }
    }
}
