import UIKit

protocol AuthRouter {
    func openRegister(from controller: UIViewController)
    func openTabs()
}

struct AuthRouterImpl: AuthRouter {
    func openRegister(from controller: UIViewController) {
        let presenter = RegisterPresenter()
        let register = RegisterViewController(presenter: presenter)
       
        controller.navigationController?.pushViewController(register, animated: true)
        
    }
    
    func openTabs() {
        //later
    }
}
