//
//  NetworkMonitor.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 09/01/25.
//

import Foundation
import Network


// 1. First, create a NetworkMonitor as an environment object
class NetworkMonitor: ObservableObject {
    @Published private(set) var isConnected = false
    private let monitor = NWPathMonitor()
    
    init() {
        startMonitoring()
    }
    
    private func startMonitoring() {
        monitor.pathUpdateHandler = { [weak self] path in
            DispatchQueue.main.async {
                self?.isConnected = path.status == .satisfied
            }
        }
        monitor.start(queue: DispatchQueue.global())
    }
}
