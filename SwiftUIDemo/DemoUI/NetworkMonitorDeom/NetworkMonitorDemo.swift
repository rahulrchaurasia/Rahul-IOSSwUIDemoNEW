//
//  NetworkMonitorDemo.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 09/01/25.
//

import SwiftUI

struct NetworkMonitorDemo: View {
    
    @StateObject private var networkMonitor = NetworkMonitor2()
    var body: some View {
        
        VStack{
            
            if networkMonitor.isConnected {
               Text ("connected via\(networkMonitor.connectionType)")
                    .foregroundStyle(.blue)
            }else{
                Text("No Internet Connection")
                    .foregroundStyle(.red)
                
                
            }
                
        }
        .onAppear(){
            networkMonitor.startMonitoring()
        }
    }
}

#Preview {
    NetworkMonitorDemo()
}
