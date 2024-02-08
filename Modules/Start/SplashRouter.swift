import UIKit

protocol SplashRouter {
    //startOndoarding
    func openAuth(from controller: UIViewController, setupFromOnboarding: Bool)
    func openTabs()
}

struct SplashRouterImpl: SplashRouter {
    func openAuth(from controller: UIViewController, setupFromOnboarding: Bool) {
        let options = AuthPresenter.Options(
            setupFromOnboarding: setupFromOnboarding)
        let presenter = AuthPresenter(
            options: options)
        let flow = AuthViewController(presenter: presenter)
        let navi = NavigationController(rootViewController: flow)
        AppDelegate.window?.rootViewController = navi
    }
    func openTabs() {
        // later
    }
}
