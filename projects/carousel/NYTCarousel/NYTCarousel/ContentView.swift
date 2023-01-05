import SwiftUI

struct PageContent {
    let imagePaths: [String]
}

struct ContentView: View {

    /// Remote images to be loaded in the TabView
    private let pagesContent: [PageContent] = [
        PageContent(imagePaths: [
            "https://placekitten.com/546/402",
            "https://placekitten.com/370/294",
            "https://placekitten.com/491/377"
        ]),
        PageContent(imagePaths: [
            "https://placekitten.com/718/714"
        ]),
        PageContent(imagePaths: [
            "https://placekitten.com/227/228",
            "https://placekitten.com/293/292",
            "https://placekitten.com/342/496",
            "https://placekitten.com/581/514"
        ])
    ]

    var body: some View {
        GeometryReader { geometry in
            CarouselView(
                pagesContent: pagesContent,
                windowSize: geometry.size
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
