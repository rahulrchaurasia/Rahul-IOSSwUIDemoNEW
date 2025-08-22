import SwiftUI

struct DownloadRowView: View {
    @ObservedObject var task: DownloadTask
    @State private var isShowingPreview = false

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(task.id.lastPathComponent)
                .font(.headline)
                .lineLimit(1)

            switch task.status {
            case .notStarted:
                Text("Ready to download.")
                    .foregroundColor(.secondary)
            
            case .downloading(let progress):
                ProgressView(value: progress)
                Text(String(format: "Downloading %.0f%%", progress * 100))
            
            case .finished:
                HStack {
                    Label("Download Complete", systemImage: "checkmark.circle.fill")
                        .foregroundColor(.green)
                    Spacer()
                    Button("View File") {
                        isShowingPreview = true
                    }
                    .buttonStyle(.bordered)
                }
            
            case .failed(let error):
                Text("Failed: \(error)")
                    .foregroundColor(.red)
            }
        }
        .padding(.vertical)
        .sheet(isPresented: $isShowingPreview) {
            if let fileURL = task.localFileLocation {
                FilePreviewController(url: fileURL)
            }
        }
    }
}

// You will also need your FilePreviewController from the previous step.