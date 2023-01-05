//
//  AsyncImageContainer.swift
//  NYTCarousel
//
//  Created by Elizabeth Levosinski on 12/13/22.
//

import SwiftUI

struct AsyncImageContainer: View {
    /// The path of image to be loaded
    let imagePath: String

    /// The closure to be run after the image has loaded
    var imageLoadedClosure = {}

    var body: some View {
        AsyncImage(url: URL(string: imagePath)) { image in
            image
                .resizable()
                .scaledToFill()
                .onFirstAppear {
                    imageLoadedClosure()
                }
        } placeholder: { ProgressView() }
    }
}
