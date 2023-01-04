import SwiftUI

/// A custom OnFirstAppear modifier that runs the code only one time.
/// https://twitter.com/mecid/status/1380471693697806337

extension View {
    func onFirstAppear(perform action: @escaping (() -> Void)) -> some View {
        modifier(OnFirstAppear(action: action))
    }
}

struct OnFirstAppear: ViewModifier {
    @State private var isFirstAppearance = true

    let action: () -> Void

    func body(content: Content) -> some View {
        content
            .onAppear {
                if isFirstAppearance {
                    action()
                    isFirstAppearance = false
                }
            }
    }
}
