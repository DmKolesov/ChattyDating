import UIKit

protocol AuthRouter {
    func openRegister(from controller: UIViewController)
    func openTabs(from controller: UIViewController)
}

class AuthRouterImpl: AuthRouter {
    func openRegister(from controller: UIViewController) {
        let presenter = RegisterPresenter()
        let register = RegisterViewController(presenter: presenter)
       
        controller.navigationController?.pushViewController(register, animated: true)
        
    }
    
    func openTabs(from controller: UIViewController) {
        let tabbar = TabbarController()
        let navi = NavigationController(rootViewController: tabbar)
        AppDelegate.window?.rootViewController = navi
    }
}
