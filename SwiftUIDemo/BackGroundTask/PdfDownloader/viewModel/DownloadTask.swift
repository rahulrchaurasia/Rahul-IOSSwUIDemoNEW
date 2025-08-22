import Foundation
import Combine

@MainActor
class DownloadTask: ObservableObject, Identifiable {
    let id: URL // Use the URL as the unique ID
    
    @Published var status: DownloadState = .notStarted
    @Published var localFileLocation: URL?

    init(url: URL) {
        self.id = url
    }
}