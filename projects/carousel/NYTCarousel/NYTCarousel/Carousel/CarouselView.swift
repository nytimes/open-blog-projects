import SwiftUI

struct CarouselView: View {
    /// The index of the currently selected page
    @State
    private var selectedIndex = 0

    /// Models for the pages
    @StateObject
    private var pagesState = PagesState()

    /// The collage's image content
    private let pagesContent: [PageContent]

    /// The device's window size
    private let windowSize: CGSize

    init(pagesContent: [PageContent], windowSize: CGSize) {
        self.pagesContent = pagesContent
        self.windowSize = windowSize

        setNavigationColors()
    }

    var body: some View {
        VStack(spacing: 0) {
            if !pagesState.models.isEmpty {
                TabView(selection: $selectedIndex) {
                    ForEach(pagesState.models, id: \.pageIndex) { viewModel in
                        CollagePage(viewModel: viewModel,
                                    selectedIndex: $selectedIndex,
                                    pageIndex: viewModel.pageIndex)
                    }
                }
                .tabViewStyle(.page)
            }
        }
        .background(Color.teal)
        .onFirstAppear {
            pagesState.models = createModels(from: pagesContent)
        }
        .onChange(of: windowSize) { newWindowSize in
            pagesState.models = pagesState.models.map { model in
                model.windowSize = newWindowSize
                return model
            }
        }
    }

    /// Sets the colors of the navigation dots in the TabView
    private func setNavigationColors() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .black
        UIPageControl.appearance().pageIndicatorTintColor = .gray
    }

    /// Sets the initial collage page models
    @MainActor
    private func createModels(from content: [PageContent]) -> [CollagePageViewModel] {
        content.enumerated().map { index, contentItem in
            CollagePageViewModel(
                content: contentItem,
                pageIndex: index,
                windowSize: windowSize
            )
        }
    }
}

extension CarouselView {

    @MainActor
    final class PagesState: ObservableObject {
        @Published
        var models = [CollagePageViewModel]()
    }

}
