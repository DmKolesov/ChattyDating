import UIKit

protocol RegisterRouter {
    func openTabs(from controller: UIViewController)
}

struct RegisterRouterImpl: RegisterRouter {
    func openTabs(from controller: UIViewController) {
        let tabbar = TabbarController()
        let navi = NavigationController(rootViewController: tabbar)
        AppDelegate.window?.rootViewController = navi
    }
}
