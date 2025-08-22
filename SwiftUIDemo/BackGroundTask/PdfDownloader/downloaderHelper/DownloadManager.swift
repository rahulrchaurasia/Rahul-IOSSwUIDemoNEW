//
//  DownloadManager.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 08/08/25.
//


import Foundation
import Combine
import UserNotifications


@MainActor
class DownloadManager: NSObject, ObservableObject {
    
    static let shared = DownloadManager()
    
    // Manages a dictionary of all download tasks, keyed by their URL.
    @Published var downloadTasks: [URL: DownloadTask] = [:]
    
    var backgroundCompletionHandler: (() -> Void)?
    
    private let backgroundSessionIdentifier = "dev.demo.SwiftUIDemo.downloader"
    private let activeDownloadsKey = "ActiveDownloadURLs"
      

    private override init() {
            super.init()
            print("DownloadManager init")
            // Proactively initialize the session
            _ = urlSession
            // ✅ YOUR IMPROVEMENT: Restore the state of any previously active downloads.
            restoreActiveDownloads()
        }
    
    private lazy var urlSession: URLSession = {
           print("Creating URLSession with id: \(backgroundSessionIdentifier)")
            let config = URLSessionConfiguration.background(withIdentifier: backgroundSessionIdentifier)
            config.sessionSendsLaunchEvents = true
            config.isDiscretionary = false
            return URLSession(configuration: config, delegate: self, delegateQueue: nil)
    }()
    
    
    // ✅ YOUR SUGGESTED FUNCTION, ADDED HERE
        private func restoreActiveDownloads1() {
            let activeURLStrings = UserDefaults.standard.stringArray(forKey: activeDownloadsKey) ?? []
            for urlString in activeURLStrings {
                if let url = URL(string: urlString) {
                    // We create the task model but set its state to a default
                    // '.downloading' state. The next delegate callback for progress
                    // will update it with the correct percentage.
                    let taskModel = DownloadTask(url: url)
                    taskModel.status = .downloading(progress: 0.0) // Assume it's in progress
                    downloadTasks[url] = taskModel
                }
            }
            if !downloadTasks.isEmpty {
                print("Restored \(downloadTasks.count) active downloads from persistence.")
            }
        }
    
    private func restoreActiveDownloads() {
        let activeURLStrings = UserDefaults.standard.stringArray(forKey: activeDownloadsKey) ?? []

        urlSession.getAllTasks { tasks in
            let activeTaskURLs = tasks.compactMap { $0.originalRequest?.url }

            for urlString in activeURLStrings {
                if let url = URL(string: urlString) {
                    let taskModel = DownloadTask(url: url)

                    if activeTaskURLs.contains(url) {
                        taskModel.status = .downloading(progress: 0.0)
                    } else {
                        taskModel.status = .notStarted
                    }

                    DispatchQueue.main.async {
                        self.downloadTasks[url] = taskModel
                    }
                }
            }
            print("Restored \(self.downloadTasks.count) active downloads from persistence.")
        }
    }
    func startDownload(url: URL) async {
        
        let taskModel: DownloadTask
        if let existingTask = downloadTasks[url] {
            taskModel = existingTask
        } else {
            taskModel = DownloadTask(url: url)
            downloadTasks[url] = taskModel
        }
        
        // ✅ ADD THIS CHECK: If the status is already downloading, do nothing.
        guard !taskModel.status.isDownloading else {
                print("Download for \(url.lastPathComponent) is already in progress.")
                return
         }
        
        persistActiveDownload(url: url)
        taskModel.status = .downloading(progress: 0.0)
        
        do {
            // ✅ THIS IS THE IOS 15 COMPATIBLE VERSION
            // We use nanoseconds instead of the new 'Duration' type.
            try await Task.sleep(nanoseconds: 2 * 1_000_000_000)
            
            // This code runs after the 2-second delay
            let downloadTask = urlSession.downloadTask(with: url)
            downloadTask.resume()
            print("Delay finished, starting download for \(url.lastPathComponent)")
            
        } catch {
            print("Download task for \(url.lastPathComponent) was cancelled during the delay.")
            taskModel.status = .notStarted
        }
    }
    
    
    // Helper to find the correct task model based on the URLSessionTask
    private func getDownloadTask(for request: URLRequest?) -> DownloadTask? {
        guard let url = request?.url else { return nil }
        return downloadTasks[url]
    }
    
    
    private func persistActiveDownload(url: URL) {
            var activeDownloads = UserDefaults.standard.stringArray(forKey: activeDownloadsKey) ?? []
            if !activeDownloads.contains(url.absoluteString) {
                activeDownloads.append(url.absoluteString)
                UserDefaults.standard.set(activeDownloads, forKey: activeDownloadsKey)
                print("Persisted active download: \(url.lastPathComponent)")
            }
        }
        
        private func removePersistedActiveDownload(url: URL) {
            var activeDownloads = UserDefaults.standard.stringArray(forKey: activeDownloadsKey) ?? []
            activeDownloads.removeAll { $0 == url.absoluteString }
            UserDefaults.standard.set(activeDownloads, forKey: activeDownloadsKey)
            print("Removed persisted download: \(url.lastPathComponent)")
        }
    
    // ✅ For Clear the Content
    func reset() {
        // Clear the published dictionary, which will remove all rows from the UI.
        downloadTasks.removeAll()
        
        // Cancel all ongoing URLSession tasks to stop them from downloading in the background.
        urlSession.getAllTasks { tasks in
            print("Cancelling \(tasks.count) ongoing downloads.")
            tasks.forEach { $0.cancel() }
        }
        print("Download manager has been reset.")
    }
    
    private func scheduleNotification(for task: DownloadTask) {
           UNUserNotificationCenter.current().getNotificationSettings { settings in
               guard settings.authorizationStatus == .authorized else {
                   print("Cannot schedule notification because permission was denied.")
                   return
               }

               let content = UNMutableNotificationContent()
               content.title = "Download Complete"
               content.body = "'\(task.id.lastPathComponent)' has finished downloading."
               content.sound = .default

               let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1.0, repeats: false)
               let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

               UNUserNotificationCenter.current().add(request) { error in
                   if let error = error {
                       print("Failed to schedule notification: \(error.localizedDescription)")
                   }
               }
           }
       }
}

// MARK: - URLSessionDownloadDelegate
extension DownloadManager: URLSessionDownloadDelegate {
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        guard let url = downloadTask.originalRequest?.url else {
            print("CRITICAL ERROR: Could not get URL from completed download task.")
            return
        }
        
        let taskModel = self.downloadTasks[url] ?? DownloadTask(url: url)
        print("didFinishDownloadingTo for: \(url.lastPathComponent)")
        
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let destinationURL = documentsDirectory.appendingPathComponent(taskModel.id.lastPathComponent)

        try? FileManager.default.removeItem(at: destinationURL)
        do {
            try FileManager.default.copyItem(at: location, to: destinationURL)
            print("Saved file to: \(destinationURL.path)")
            
            removePersistedActiveDownload(url: url)
            
            DispatchQueue.main.async {
                if self.downloadTasks[url] != nil {
                    taskModel.status = .finished(location: destinationURL)
                    taskModel.localFileLocation = destinationURL
                }
               
                self.scheduleNotification(for: taskModel)
            }
        } catch {
            print("Error copying downloaded file: \(error.localizedDescription)")
            DispatchQueue.main.async {
                if self.downloadTasks[url] != nil {
                    taskModel.status = .failed(error: "Could not move file.")
                }
            }
        }
    }

    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        guard let url = task.originalRequest?.url else { return }
        
        removePersistedActiveDownload(url: url)
        
        if let error = error, (error as NSError).code != NSURLErrorCancelled {
            print("Download for \(url.lastPathComponent) completed with error: \(error.localizedDescription)")
            DispatchQueue.main.async {
                self.downloadTasks[url]?.status = .failed(error: error.localizedDescription)
            }
        }
    }

    func urlSessionDidFinishEvents(forBackgroundURLSession session: URLSession) {
        print("urlSessionDidFinishEvents called")
        DispatchQueue.main.async {
            if let handler = self.backgroundCompletionHandler {
                print("Calling background completion handler now")
                handler()
                self.backgroundCompletionHandler = nil
            }
        }
    }
    

    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        guard let taskModel = getDownloadTask(for: downloadTask.originalRequest) else { return }
        let progress = Double(totalBytesWritten) / Double(totalBytesExpectedToWrite)
        
        DispatchQueue.main.async {
            if case .downloading = taskModel.status {
                taskModel.status = .downloading(progress: progress)
            }
        }
    }

}
