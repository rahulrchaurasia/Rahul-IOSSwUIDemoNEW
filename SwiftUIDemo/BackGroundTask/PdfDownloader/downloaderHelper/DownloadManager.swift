//
//  DownloadManager.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 08/08/25.
//


import Foundation
import Combine

@MainActor
class DownloadManager: NSObject, ObservableObject {
    
    // 1. Create a static, shared instance. This is the Singleton pattern.
        static let shared = DownloadManager()
      
    
    @Published var downloadState: DownloadState = .notStarted
    
    // UPDATED URL for the PDF test file
    let downloadURL = URL(string: "https://www.orimi.com/pdf-test.pdf")!
    
    private var downloadTask: URLSessionDownloadTask?
    var backgroundCompletionHandler: (() -> Void)?

    // 2. Make the initializer private to ensure no other part of the app can
        //    create another instance. Everyone MUST use .shared.
        private override init() {
            super.init()
        }
        
    
    //dev.demo.SwiftUIDemo.bg-task-1
    private lazy var urlSession: URLSession = {
        let config = URLSessionConfiguration.background(withIdentifier: "dev.demo.SwiftUIDemo.downloader")
        config.isDiscretionary = false
        config.sessionSendsLaunchEvents = true
        return URLSession(configuration: config, delegate: self, delegateQueue: nil)
    }()
    
    func checkInitialState() {
        if let fileLocation = downloadedFileLocation(), FileManager.default.fileExists(atPath: fileLocation.path) {
            self.downloadState = .finished(location: fileLocation)
        } else {
            self.downloadState = .notStarted
        }
    }
    
    func startDownload() {
        self.downloadState = .downloading(progress: 0.0)
        downloadTask = urlSession.downloadTask(with: downloadURL)
        downloadTask?.resume()
    }

    func cancelDownload() {
        downloadTask?.cancel()
    }
    
    func deleteDownloadedFile() {
        guard case .finished(let location) = downloadState else { return }
        do {
            try FileManager.default.removeItem(at: location)
            self.downloadState = .notStarted
        } catch {
            self.downloadState = .failed(error: "Could not delete file.")
        }
    }
    
    private func downloadedFileLocation() -> URL? {
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return documentsDirectory.appendingPathComponent(downloadURL.lastPathComponent)
    }
}

// MARK: - URLSessionDownloadDelegate Implementation
extension DownloadManager: URLSessionDownloadDelegate {
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        guard let destinationURL = downloadedFileLocation() else {
            DispatchQueue.main.async { self.downloadState = .failed(error: "Could not determine save location.") }
            return
        }
        try? FileManager.default.removeItem(at: destinationURL)
        do {
            try FileManager.default.copyItem(at: location, to: destinationURL)
            DispatchQueue.main.async { self.downloadState = .finished(location: destinationURL) }
        } catch {
            DispatchQueue.main.async { self.downloadState = .failed(error: "Could not move file.") }
        }
    }

    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        let progress = Double(totalBytesWritten) / Double(totalBytesExpectedToWrite)
        DispatchQueue.main.async {
            if case .downloading = self.downloadState {
                self.downloadState = .downloading(progress: progress)
            }
        }
    }

    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        if let error = error {
            let nsError = error as NSError
            if nsError.code == NSURLErrorCancelled {
                DispatchQueue.main.async { self.downloadState = .notStarted }
            } else {
                DispatchQueue.main.async { self.downloadState = .failed(error: error.localizedDescription) }
            }
        }
    }

    func urlSessionDidFinishEvents(forBackgroundURLSession session: URLSession) {
        DispatchQueue.main.async {
            self.backgroundCompletionHandler?()
            self.backgroundCompletionHandler = nil
        }
    }
}
