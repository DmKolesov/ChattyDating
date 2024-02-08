import UIKit

final class SplashPresenter {
    
    private(set) var viewModel = SplashViewModel()
    private let router: SplashRouter
    
    init(router: SplashRouter = SplashRouterImpl()) {
        self.router = router
    }
    
    func updateTitle() -> String {
        let result = viewModel.title
        return result
    }
    
    func display() {
    
    }
    func openAuth(from controller: UIViewController) {
        router.openAuth(from: controller, setupFromOnboarding: false)
    }
    
}
