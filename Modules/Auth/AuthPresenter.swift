import UIKit

final class AuthPresenter {
    struct Options {
        let setupFromOnboarding: Bool
    }
    
    private let options: Options
    private let router: AuthRouter
    
    init(options: Options, router: AuthRouter = AuthRouterImpl()) {
        self.options = options
        self.router = router
    }
    
    func openRegister(from controller: UIViewController) {
        router.openRegister(from: controller)
    }
}
