import SwiftUI

struct CollageImageLayoutProvider {
    private enum Kind {
        case single
        case triple
        case quad
    }

    let elementIndex: ElementIndex
    let elementCount: Int
    let isCompact: Bool
    let isLandscape: Bool
    let windowSize: CGSize

    enum ElementIndex: Int {
        case zero = 0, one, two, three
    }

    private var type: Kind {
        switch elementCount {
        case 1: return .single
        case 3: return .triple
        case 4: return .quad
        default:
            return .single
        }
    }
}

extension CollageImageLayoutProvider {
    /// The starting opacity value for animations
    var opacityValue: CGFloat { 0.3 }

    /// The duration for an view's opacity animation
    var opacityAnimationDuration: CGFloat { 0.7 }

    /// The duration for an view's vertical placement animation
    var verticalAnimationDuration: CGFloat { 0.6 }

    /// The y offset for an view's vertical animation
    var verticalAnimationOffset: CGFloat { 30 }

    /// The delays for each view's animation
    var animationDelay: CGFloat {
        switch type {
        case .single, .triple:
            switch elementIndex {
            case .zero:
                return 0
            case .one:
                return 0.2
            case .two:
                return 0.4
            case .three:
                return 0 // NA
            }
        case .quad:
            switch elementIndex {
            case .zero:
                return 0
            case .one:
                return 0.1
            case .two:
                return 0.2
            case .three:
                return 0.4
            }
        }
    }

    /// The zIndex (the layering order of views) in the parent view
    var zIndex: Double {
        switch type {
        case .single, .quad:
            return 0
        case .triple:
            switch elementIndex {
            case .one, .two, .three:
                return 0
            case .zero:
                return 1
            }
        }
    }

    /// The x and y positions of each image in the templates
    var offset: CGSize {
        switch type {
        case .single:
            if isCompact {
                return CGSize(
                    width: (70 / phoneWidth) * windowWidth,
                    height: (12 / phoneHeight) * windowHeight
                )
            } else if isLandscape {
                return CGSize(
                    width: (162 / iPadHeight) * windowWidth,
                    height: (24 / iPadWidth) * windowHeight
                )
            } else {
                return CGSize(
                    width: (155 / iPadWidth) * windowWidth,
                    height: (24 / iPadHeight) * windowHeight
                )
            }
        case .triple:
            switch elementIndex {
            case .zero:
                if isCompact {
                    return CGSize(
                        width: 0,
                        height: 0
                    )
                } else if isLandscape {
                    return CGSize(
                        width: 0,
                        height: (24 / iPadWidth) * windowHeight
                    )
                } else {
                    return CGSize(
                        width: 0,
                        height: (24 / iPadHeight) * windowHeight
                    )
                }
            case .one:
                if isCompact {
                    return CGSize(
                        width: (253 / phoneWidth) * windowWidth,
                        height: (122 / phoneHeight) * windowHeight
                    )
                } else if isLandscape {
                    return CGSize(
                        width: (882 / iPadHeight) * windowWidth,
                        height: 0
                    )
                } else {
                    return CGSize(
                        width: (546 / iPadWidth) * windowWidth,
                        height: (154 / iPadHeight) * windowHeight
                    )
                }
            case .two:
                if isCompact {
                    return CGSize(
                        width: (16 / phoneWidth) * windowWidth,
                        height: (274 / phoneHeight) * windowHeight
                    )
                } else if isLandscape {
                    return CGSize(
                        width: (343 / iPadHeight) * windowWidth,
                        height: (104 / iPadWidth) * windowHeight
                    )
                } else {
                    return CGSize(
                        width: (73 / iPadWidth) * windowWidth,
                        height: (464 / iPadHeight) * windowHeight
                    )
                }
            case .three:
                return .zero
            }
        case .quad:
            switch elementIndex {
            case .zero:
                if isCompact {
                    return CGSize(
                        width: (25 / phoneWidth) * windowWidth,
                        height: 0
                    )
                } else if isLandscape {
                    return CGSize(
                        width: (690 / iPadHeight) * windowWidth,
                        height: (284 / iPadWidth) * windowHeight
                    )
                } else {
                    return CGSize(
                        width: 0,
                        height: (12 / iPadHeight) * windowHeight
                    )
                }
            case .one:
                if isCompact {
                    return CGSize(
                        width: (140 / phoneWidth) * windowWidth,
                        height: 0
                    )
                } else if isLandscape {
                    return CGSize(
                        width: (540 / iPadHeight) * windowWidth,
                        height: (24 / iPadWidth) * windowHeight
                    )
                } else {
                    return CGSize(
                        width: (255 / iPadWidth) * windowWidth,
                        height: (12 / iPadHeight) * windowHeight
                    )
                }
            case .two:
                if isCompact {
                    return CGSize(
                        width: (284 / phoneWidth) * windowWidth,
                        height: (44 / phoneHeight) * windowHeight
                    )
                } else if isLandscape {
                    return CGSize(
                        width: (885 / iPadHeight) * windowWidth,
                        height: 0
                    )
                } else {
                    return CGSize(
                        width: (574 / iPadWidth) * windowWidth,
                        height: (104 / iPadHeight) * windowHeight
                    )
                }
            case .three:
                if isCompact {
                    return CGSize(
                        width: (10 / phoneWidth) * windowWidth,
                        height: (145 / phoneHeight) * windowHeight
                    )
                } else if isLandscape {
                    return CGSize(
                        width: 0,
                        height: (63 / iPadWidth) * windowHeight
                    )
                } else {
                    return CGSize(
                        width: 0,
                        height: (325 / iPadHeight) * windowHeight
                    )
                }
            }
        }
    }

    /// The actual size of the containing view
    var frame: (CGSize, Alignment) {
        switch type {
        case .single:
            if isCompact {
                let size = CGSize(
                    width: (361 / phoneWidth) * windowWidth,
                    height: (345 / phoneHeight) * windowHeight
                )
                return (size, .leading)
            } else if isLandscape {
                let size = CGSize(
                    width: (907 / iPadHeight) * windowWidth,
                    height: (405 / iPadWidth) * windowHeight
                )
                return (size, .leading)
            } else {
                let size = CGSize(
                    width: (718 / iPadWidth) * windowWidth,
                    height: (714 / iPadHeight) * windowHeight
                )
                return (size, .leading)
            }
        case .triple:
            switch elementIndex {
            case .zero:
                if isCompact {
                    let size = CGSize(
                        width: (229 / phoneWidth) * windowWidth,
                        height: (182 / phoneHeight) * windowHeight
                    )
                    return (size, .center)
                } else if isLandscape {
                    let size = CGSize(
                        width: (476 / iPadHeight) * windowWidth,
                        height: (352 / iPadWidth) * windowHeight
                    )
                    return (size, .center)
                } else {
                    let size = CGSize(
                        width: (486 / iPadWidth) * windowWidth,
                        height: (402 / iPadHeight) * windowHeight
                    )
                    return (size, .center)
                }
            case .one:
                if isCompact {
                    let size = CGSize(
                        width: (185 / phoneWidth) * windowWidth,
                        height: (123 / phoneHeight) * windowHeight
                    )
                    return (size, .center)
                } else if isLandscape {
                    let size = CGSize(
                        width: (370 / iPadHeight) * windowWidth,
                        height: (245 / iPadWidth) * windowHeight
                    )
                    return (size, .center)
                } else {
                    let size = CGSize(
                        width: (370 / iPadWidth) * windowWidth,
                        height: (294 / iPadHeight) * windowHeight
                    )
                    return (size, .center)
                }
            case .two:
                if isCompact {
                    let size = CGSize(
                        width: (222 / phoneWidth) * windowWidth,
                        height: (196 / phoneHeight) * windowHeight
                    )
                    return (size, .center)
                } else if isLandscape {
                    let size = CGSize(
                        width: (463 / iPadHeight) * windowWidth,
                        height: (373 / iPadWidth) * windowHeight
                    )
                    return (size, .center)
                } else {
                    let size = CGSize(
                        width: (491 / iPadWidth) * windowWidth,
                        height: (377 / iPadHeight) * windowHeight
                    )
                    return (size, .center)
                }
            case .three:
                return (.zero, .top)
            }
        case .quad:
            switch elementIndex {
            case .zero:
                if isCompact {
                    let size = CGSize(
                        width: (103 / phoneWidth) * windowWidth,
                        height: (103 / phoneHeight) * windowHeight
                    )
                    return (size, .center)
                } else if isLandscape {
                    let width = (184 / iPadHeight) * windowWidth
                    let size = CGSize(width: width, height: width)
                    return (size, .center)
                } else {
                    let size = CGSize(
                        width: (228 / iPadWidth) * windowWidth,
                        height: (228 / iPadHeight) * windowHeight
                    )
                    return (size, .center)
                }
            case .one:
                if isCompact {
                    let size = CGSize(
                        width: (132 / phoneWidth) * windowWidth,
                        height: (132 / phoneHeight) * windowHeight
                    )
                    return (size, .top)
                } else if isLandscape {
                    let width = (251 / iPadHeight) * windowWidth
                    let size = CGSize(width: width, height: width)
                    return (size, .top)
                } else {
                    let size = CGSize(
                        width: (292 / iPadWidth) * windowWidth,
                        height: (292 / iPadHeight) * windowHeight
                    )
                    return (size, .top)
                }
            case .two:
                if isCompact {
                    let size = CGSize(
                        width: (167 / phoneWidth) * windowWidth,
                        height: (224 / phoneHeight) * windowHeight
                    )
                    return (size, .center)
                } else if isLandscape {
                    let size = CGSize(
                        width: (316 / iPadHeight) * windowWidth,
                        height: (475 / iPadWidth) * windowHeight
                    )
                    return (size, .center)
                } else {
                    let size = CGSize(
                        width: (342 / iPadWidth) * windowWidth,
                        height: (496 / iPadHeight) * windowHeight
                    )
                    return (size, .center)
                }
            case .three:
                if isCompact {
                    let size = CGSize(
                        width: (262 / phoneWidth) * windowWidth,
                        height: (243 / phoneHeight) * windowHeight
                    )
                    return (size, .top)
                } else if isLandscape {
                    let size = CGSize(
                        width: (524 / iPadHeight) * windowWidth,
                        height: (414 / iPadWidth) * windowHeight
                    )
                    return (size, .top)
                } else {
                    let size = CGSize(
                        width: (548 / iPadWidth) * windowWidth,
                        height: (514 / iPadHeight) * windowHeight
                    )
                    return (size, .top)
                }
            }
        }
    }

    // MARK: - Layout references

    private var windowHeight: CGFloat {
        windowSize.height
    }

    private var windowWidth: CGFloat {
        windowSize.width
    }

    // Reference wide dimensions
    private var iPadWidth: CGFloat { 834 }
    private var iPadHeight: CGFloat { 1195 }

    // Reference compact dimensions
    private var phoneWidth: CGFloat { 375 }
    private var phoneHeight: CGFloat { 812 }
}
