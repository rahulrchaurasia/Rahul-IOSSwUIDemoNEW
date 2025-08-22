//
//  DownloadManagerOld.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 13/08/25.
//

import Foundation

import Foundation
import Combine
import UserNotifications


@MainActor
class DownloadManagerOld: NSObject, ObservableObject {
    
    static let shared = DownloadManagerOld()
    
    // Manages a dictionary of all download tasks, keyed by their URL.
    @Published var downloadTasks: [URL: DownloadTask] = [:]
    
    var backgroundCompletionHandler: (() -> Void)?

    private override init() {
        super.init()
    }
    
    private lazy var urlSession: URLSession = {
        let config = URLSessionConfiguration.background(withIdentifier: "dev.demo.SwiftUIDemo.downloader")
        return URLSession(configuration: config, delegate: self, delegateQueue: nil)
    }()
    
   
   /*
    downloadTask.resume(): The downloadTask object starts in a suspended (paused) state. The .resume() method is the command that tells your agent, "Okay, start this job now!". This is the line that actually kicks off the network request.
    
    In summary: downloadTask(with:) prepares the job, and resume() starts the job.
    */
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
/*
 URLSessionDownloadDelegate is a "contract" (called a protocol in Swift) written by Apple. This contract lists a number of duties (or methods) that someone who wants to manage downloads must be able to perform.
 */
extension DownloadManagerOld : URLSessionDownloadDelegate {
    
   /* REQUIRED: This is the most important one. When a download finishes, the OS gives you the file at a temporary location. You must implement this method to tell the system what to do with the finished file (i.e., move it to a permanent location). If you don't implement this, you'll never be able to access your downloaded file.
    */
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        guard let taskModel = getDownloadTask(for: downloadTask.originalRequest) else { return }
        
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let destinationURL = documentsDirectory.appendingPathComponent(taskModel.id.lastPathComponent)
        
        try? FileManager.default.removeItem(at: destinationURL)
        do {
            try FileManager.default.copyItem(at: location, to: destinationURL)
            DispatchQueue.main.async {
                taskModel.status = .finished(location: destinationURL)
                taskModel.localFileLocation = destinationURL
                
                // ✅ SCHEDULE NOTIFICATION HERE
                self.scheduleNotification(for: taskModel)
            }
        } catch {
            DispatchQueue.main.async {
                taskModel.status = .failed(error: "Could not move file.")
            }
        }
    }

    
    
    /*OPTIONAL: You only need to implement this if you want to show a progress bar. This method is called repeatedly by the OS during the download, giving you progress updates. If you remove this method, the download will still work perfectly, but you won't be able to show the user the download percentage.
     */
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        guard let taskModel = getDownloadTask(for: downloadTask.originalRequest) else { return }
        let progress = Double(totalBytesWritten) / Double(totalBytesExpectedToWrite)
        
        DispatchQueue.main.async {
            if case .downloading = taskModel.status {
                taskModel.status = .downloading(progress: progress)
            }
        }
    }

    /*
     — OPTIONAL: This method is called when a task finishes, either successfully or
       with an error. It's highly recommended to implement it so you can handle network
        failures, but it is not strictly required.
     */
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        guard let taskModel = getDownloadTask(for: task.originalRequest) else { return }

        if let error = error, (error as NSError).code != NSURLErrorCancelled {
            DispatchQueue.main.async {
                taskModel.status = .failed(error: error.localizedDescription)
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
