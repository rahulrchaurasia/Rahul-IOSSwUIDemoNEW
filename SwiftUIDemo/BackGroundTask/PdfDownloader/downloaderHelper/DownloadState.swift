//
//  DownloadState.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 08/08/25.
//
/*
 1️⃣ Context — Why static func ==
 In Swift, if you conform a type to Equatable, Swift will normally automatically synthesize the == function for you if:

 All associated values in your enum/struct are also Equatable

 You don’t need special matching rules

 Here, you wrote a custom implementation of == because the equality logic might require custom matching between cases.
 
 
 2️⃣ Signature meaning

 static func == (lhs: DownloadState, rhs: DownloadState) -> Bool
 lhs = left-hand side of comparison (state1 == state2)

 rhs = right-hand side

 Returns Bool → true if both are considered equal, false otherwise.
 
 
 ✅ — Swift allows you to use switch on tuples, so


 switch (lhs, rhs)
 is just switching over a tuple whose first element is lhs and second element is rhs.

 That’s why your cases look like:

 case (.notStarted, .notStarted):
     return true

 case (.downloading(let p1), .downloading(let p2)):
     return p1 == p2

 */
import Foundation


enum DownloadState: Equatable {
    case notStarted
    case downloading(progress: Double)
    case finished(location: URL)
    case failed(error: String)

    /*
     In Swift, operators like +, -, *, /, and == are actually special functions. By writing static func ==, we are providing our own custom implementation for what the == operator should do when used with our DownloadState type. This concept is called Operator Overloading.
     */
    static func == (lhs: DownloadState, rhs: DownloadState) -> Bool {
        switch (lhs, rhs) {
        case (.notStarted, .notStarted): return true
        case (let .downloading(p1), let .downloading(p2)): return p1 == p2
        case (let .finished(u1), let .finished(u2)): return u1 == u2
        case (let .failed(e1), let .failed(e2)): return e1 == e2
        default: return false
        }
    }
    
    
    // ✅ ADD THIS COMPUTED PROPERTY
        // This helper makes your code much more readable.
        var isDownloading: Bool {
            if case .downloading = self {
                // If the current state is .downloading, return true.
                return true
            }
            // For any other state, return false.
            return false
        }
}
