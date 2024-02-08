import UIKit

final class NavigationController: UINavigationController {
    

    override var childForStatusBarStyle: UIViewController? {
        return visibleViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
}

