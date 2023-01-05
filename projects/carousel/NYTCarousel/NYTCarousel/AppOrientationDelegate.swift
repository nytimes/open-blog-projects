//
//  AppOrientationDelegate.swift
//  NYTCarousel
//
//  Created by Elizabeth Levosinski on 11/26/22.
//

import UIKit

// Created by https://fabisevi.ch/ based on https://developer.apple.com/forums/thread/128830
// Sets the app's orientation, which can be set for effect using onAppear or onDisappear
protocol AppOrientationDelegate: UIApplicationDelegate {
    static var orientation: UIInterfaceOrientationMask { get set }
}

extension AppOrientationDelegate {

    func setOrientation(orientation: UIInterfaceOrientationMask) {
        Self.orientation = orientation
        UIDevice.current.setValue(orientation.rawValue, forKey: "orientation")
    }

}
