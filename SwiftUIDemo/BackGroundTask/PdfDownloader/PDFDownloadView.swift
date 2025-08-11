//
//  PDFDownloadView.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 08/08/25.
//

import SwiftUI

struct PDFDownloadView: View {
    
    @EnvironmentObject var downloadManager: DownloadManager
    
    
    var body: some View {
        NavigationView {
            VStack(spacing: 25) {
                Text("PDF Background Downloader")
                    .font(.largeTitle.bold())
                
                switch downloadManager.downloadState {
                case .notStarted:
                    Button {
                        downloadManager.startDownload()
                    } label: {
                        Label("Download Test PDF", systemImage: "icloud.and.arrow.down")
                    }
                    .buttonStyle(.borderedProminent)
                    
                case .downloading(let progress):
                    ProgressView(value: progress, total: 1.0) {
                        Text("Downloading PDF...")
                    } currentValueLabel: {
                        Text(String(format: "%.0f%%", progress * 100))
                    }
                    .progressViewStyle(.circular)
                    
                    Button("Cancel") {
                        downloadManager.cancelDownload()
                    }
                    .buttonStyle(.bordered)
                    .tint(.red)
                    
                case .finished(let location):
                    VStack(spacing: 10) {
                        Image(systemName: "doc.text.fill")
                            .font(.largeTitle)
                            .foregroundColor(.red)
                        Label("Download Complete!", systemImage: "checkmark.circle.fill")
                            .font(.headline)
                            .foregroundColor(.green)
                        
                        Text(location.lastPathComponent)
                            .font(.caption)
                            .padding(.horizontal)
                        
                        Button("Delete & Re-download") {
                            downloadManager.deleteDownloadedFile()
                        }
                        .buttonStyle(.bordered)
                        .tint(.red)
                    }
                    
                case .failed(let error):
                    VStack(spacing: 10) {
                        Label("Download Failed", systemImage: "xmark.octagon.fill")
                            .font(.headline)
                            .foregroundColor(.red)
                        
                        Text(error)
                            .font(.caption)
                        
                        Button("Try Again") {
                            downloadManager.startDownload()
                        }
                        .buttonStyle(.borderedProminent)
                    }
                }
            }
            .padding()
            .navigationTitle("PDF Transfer")
            .onAppear {
                downloadManager.checkInitialState()
            }
        }
    }
}

#Preview {
    PDFDownloadView()
}
