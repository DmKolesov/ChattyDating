import UIKit

final class RegisterPresenter {
    
    let router: RegisterRouter
    
    init(router: RegisterRouter = RegisterRouterImpl()) {
        self.router = router
    }
    func openTab(from controller: UIViewController) {
        router.openTabs(from: controller)
    }
}
