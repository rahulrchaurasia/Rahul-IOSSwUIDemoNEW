//
//  PDFDownloadView.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 08/08/25.
//

import SwiftUI



struct PDFDownloadView: View {
    
    @EnvironmentObject var downloadManager: DownloadManager
        
        // The array of URLs you wanted to use.
        let sampleURLs: [URL] = [
            URL(string: "https://www.orimi.com/pdf-test.pdf")!,
            URL(string: "https://stsci-opo.org/STScI-01G8G54S2C2V0T8C3J62V13T10.tif")!
        ]
        
        var body: some View {
            NavigationView {
                VStack {
                    Text("Start a New Download")
                        .font(.headline)
                    HStack {
                        Button("PDF") {
                            
                            // Create a new asynchronous Task to call our async function
                            Task {
                                await downloadManager.startDownload(url: sampleURLs[0])
                            }
                            
                        }
                        Button("TIF Image") {
                            
                            Task {
                                await downloadManager.startDownload(url: sampleURLs[1])
                            }
                        }
                    }
                    .buttonStyle(.bordered)
                    .padding()
                    
                    // The list now iterates over all download tasks.
                    List(Array(downloadManager.downloadTasks.values)) { task in
                        DownloadRowView(task: task)
                    }
                }
                .navigationTitle("Multi-Downloader")
//                .onDisappear{
//                    
//                    downloadManager.reset()
//                }
            }
        }
}

#Preview {
    PDFDownloadView()
}
