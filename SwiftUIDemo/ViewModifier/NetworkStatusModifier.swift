//
//  NetworkStatusModifier.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 09/01/25.
//

import Foundation
import SwiftUICore

struct NetworkStatusModifier : ViewModifier {
   
    @EnvironmentObject var networkMonitor: NetworkMonitor
    @State private var showingAlert = false

    
    func body(content: Content) -> some View {
           content
               .overlay(
                   ZStack {
                       if !networkMonitor.isConnected {
                           Color.black.opacity(0.4)
                               .ignoresSafeArea()
                               .transition(.opacity)
                           
                           NetworkAlertView()
                               .transition(.scale)
                       }
                   }
                   .animation(.default, value: networkMonitor.isConnected)
               )
       }
}
