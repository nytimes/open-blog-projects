import SwiftUI

@main
struct NYTCarouselApp: App {

    @UIApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

private class AppDelegate: NSObject {
    static var orientation = UIInterfaceOrientationMask.portrait
    static var isiPad = UIDevice.current.userInterfaceIdiom == .pad
}

extension AppDelegate: UIApplicationDelegate, AppOrientationDelegate {

    /// Locks the orientation to be `portrait` on iPhones vs. any orientation for iPads
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return AppDelegate.isiPad ? .all : AppDelegate.orientation
    }

}
