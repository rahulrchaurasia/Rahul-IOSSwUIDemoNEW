enum DownloadState: Equatable {
    case notStarted
    case downloading(progress: Double)
    case finished(location: URL)
    case failed(error: String)

    static func == (lhs: DownloadState, rhs: DownloadState) -> Bool {
        switch (lhs, rhs) {
        case (.notStarted, .notStarted): return true
        case (let .downloading(p1), let .downloading(p2)): return p1 == p2
        case (let .finished(u1), let .finished(u2)): return u1 == u2
        case (let .failed(e1), let .failed(e2)): return e1 == e2
        default: return false
        }
    }
}