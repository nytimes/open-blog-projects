import SwiftUI

struct CollagePage: View {

    /// A state object that keeps track of whether or not the page is selected
    @ObservedObject
    var viewModel: CollagePageViewModel

    /// The index of the currently selected page in the TabView
    @Binding
    var selectedIndex: Int

    /// This  page's index in the TabView
    let pageIndex: Int

    /// is the device orientation landscape
    @State
    private var isLandscape = false

    /// Is the device an iPhone or an iPad
    private var isCompact: Bool {
        horizontalSizeClass != .regular
    }

    /// The horizontal size class of this environment.
    @Environment(\.horizontalSizeClass)
    private var horizontalSizeClass

    /// An array to keep track of which images successfully loaded
    @State
    private var imagesLoaded: [Bool] = []

    var body: some View {
        ZStack(alignment: .topLeading) {
            if !imagesLoaded.isEmpty {
                ForEach(Array(zip(viewModel.content.imagePaths.indices, viewModel.content.imagePaths)), id: \.0) { imageIndex, imagePath in
                    let imageLayout = CollageImageLayoutProvider(elementIndex: .init(rawValue: imageIndex) ?? .zero,
                                                                 elementCount: viewModel.content.imagePaths.count,
                                                                 isCompact: isCompact,
                                                                 isLandscape: isLandscape,
                                                                 windowSize: viewModel.windowSize)

                    /// Is the current page the selected one or have the images already been loaded once
                    if (selectedIndex == pageIndex) || imagesLoaded.contains(true) {
                        AsyncImageContainer(imagePath: imagePath, imageLoadedClosure: {
                            imagesLoaded[imageIndex] = true
                        })
                        .positioned(with: imageLayout,
                                    isSelected: selectedIndex == pageIndex,
                                    isImageLoaded: imagesLoaded[imageIndex])
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .onFirstAppear {
            imagesLoaded = Array(repeating: false, count: viewModel.content.imagePaths.count)
        }
        .onAppear {
            updateOrientationStatus(from: UIDevice.current.orientation)
        }
        .onRotate { orientation in
            updateOrientationStatus(from: orientation)
        }
    }

    /// A method that updates the 'isLandscape' state variable for determining portrait vs landscape
    private func updateOrientationStatus(from orientation: UIDeviceOrientation) {
        isLandscape = orientation.isLandscape
    }
}
