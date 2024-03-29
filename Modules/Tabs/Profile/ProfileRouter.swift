import UIKit

protocol ProfileRouter {
    func presentMessageModule(from controller: UIViewController)

}

class ProfileRouterImpl: ProfileRouter {
    func presentMessageModule(from controller: UIViewController) {
        let presenter = MessagePresenter()
        let viewController = MessageViewController(presenter: presenter)
//        controller.navigationController?.pushViewController(viewController, animated: true)
        controller.present(viewController, animated: true, completion: nil)
    }
}
