import SwiftUI

extension View {
    func positioned(with layout: CollageImageLayoutProvider,
                    isSelected: Bool,
                    isImageLoaded: Bool) -> some View
    {
        modifier(CollageImageModifier(layout: layout,
                                      isSelected: isSelected,
                                      isImageLoaded: isImageLoaded))
    }
}

private struct CollageImageModifier: ViewModifier {
    /// A property that shares the layout positioning values
    /// for each of the images in the carousel
    let layout: CollageImageLayoutProvider

    /// A property that indicates if this page is currently selected
    let isSelected: Bool

    /// A property that indicates when an image has successfully loaded
    let isImageLoaded: Bool

    /// This property changing is what 'animates' the opacity
    /// of the image in the carousel
    @State
    private var isAnimatingOpacity = false

    /// This property changing is what 'animates' the position
    /// of the image in the carousel
    @State
    private var isAnimatingPosition = false

    func body(content: Content) -> some View {
        content
            .frame(width: layout.frame.0.width,
                   height: layout.frame.0.height,
                   alignment: layout.frame.1)
            .clipped()
            .zIndex(layout.zIndex)
            .opacity(isAnimatingOpacity ? 1 : layout.opacityValue)
            .offset(x: layout.offset.width,
                    y: isAnimatingPosition ? layout.offset.height : (layout.offset.height + layout.verticalAnimationOffset))
            .onChange(of: isSelected) { newSelectedValue in
                /// Animates the page images when the page is selected or deselected
                imageAnimations(isAnimating: newSelectedValue)
            }
            .onChange(of: isImageLoaded) { isLoaded in
                if isLoaded {
                    imageAnimations(isAnimating: true)
                }
            }
    }

    /// Animations for the image's opacity and vertical positioning
    private func imageAnimations(isAnimating: Bool) {

        let animationDelay = layout.animationDelay

        withAnimation(
            Animation
                .linear(duration: layout.opacityAnimationDuration)
                .delay(animationDelay)
        ) {
            self.isAnimatingOpacity = isAnimating
        }

        withAnimation(
            Animation
                .linear(duration: layout.verticalAnimationDuration)
                .delay(animationDelay)
        ) {
            self.isAnimatingPosition = isAnimating
        }
    }
}

