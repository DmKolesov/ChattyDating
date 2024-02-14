import UIKit

final class NavigationController: UINavigationController {
    

    override var childForStatusBarStyle: UIViewController? {
        return visibleViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        
        navigationBar.isHidden = true
    }
}


extension NavigationController: UINavigationControllerDelegate {

    func navigationController(_ navigationController: UINavigationController,
                              willShow viewController: UIViewController,
                              animated: Bool) {
        let tabsController = navigationController.tabBarController as? TabbarController

        tabsController?.tabsView.isHidden = viewController.hidesBottomBarWhenPushed
        tabsController?.tabBar.isHidden = true
    }
}
