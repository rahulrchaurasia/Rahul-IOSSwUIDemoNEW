//
//  AppDelegate.swift
//  RahulProjectSwiftUI
//
//  Created by Rahul Chaurasia on 21/11/24.
//

import Foundation
import UIKit
import FirebaseCore

class AppDelegate : NSObject, UIApplicationDelegate {
    
    var downloadManager: DownloadManager?
        
    
    // for Background Task
        func application(_ application: UIApplication, handleEventsForBackgroundURLSession identifier: String, completionHandler: @escaping () -> Void) {
           
            // Directly access the single, shared instance. This is much cleaner and safer.
            DownloadManager.shared.backgroundCompletionHandler = completionHandler

        }
    
  }
