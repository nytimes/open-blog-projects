import SwiftUI

/// The view model for the collage page
@MainActor
final class CollagePageViewModel: ObservableObject {
    /// The content for this page
    let content: PageContent

    /// The index of the page within the carousel
    let pageIndex: Int

    /// The size of the current device's window
    @Published
    var windowSize: CGSize

    init(
        content: PageContent,
        pageIndex: Int,
        windowSize: CGSize
    ) {
        self.content = content
        self.pageIndex = pageIndex
        self.windowSize = windowSize
    }
}
