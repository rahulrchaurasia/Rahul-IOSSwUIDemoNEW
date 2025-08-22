//
//  AppDelegate.swift
//  RahulProjectSwiftUI
//
//  Created by Rahul Chaurasia on 21/11/24.
//

import Foundation
import UIKit
import FirebaseCore
import UserNotifications

class AppDelegate : NSObject, UIApplicationDelegate   {
    
    var downloadManager: DownloadManager?
        
    
    
    func application(_ application: UIApplication,
                         didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
            
            // Set this AppDelegate as the delegate for the notification center
               // to handle foreground notifications.
               UNUserNotificationCenter.current().delegate = self
               return true
        }
    
    // for Background Task : This handles the background URL session events.
        func application(_ application: UIApplication, handleEventsForBackgroundURLSession identifier: String, completionHandler: @escaping () -> Void) {
           
            // Directly access the single, shared instance. This is much cleaner and safer.
            print("Re-launched for background URLSession: \(identifier)")
            DownloadManager.shared.backgroundCompletionHandler = completionHandler

        }
    
  }


// MARK: - UNUserNotificationCenterDelegate
// ✅ 3. Add this extension to conform to the delegate protocol.
extension AppDelegate: UNUserNotificationCenterDelegate {
    
    // This function is called by the system just before a notification is presented.
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        // Here, we tell iOS to show the notification banner and play the sound,
        // even if the app is currently in the foreground.
        completionHandler([.banner, .sound, .badge])
    }
}
