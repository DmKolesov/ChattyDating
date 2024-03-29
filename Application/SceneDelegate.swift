
import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.windowScene = windowScene
        
//        let presenter = SplashPresenter()
//        let splash = SplashScreenViewController(presenter: presenter)
//        window?.rootViewController = splash
        
//        let presenter = MainPresenter()
//        window?.rootViewController = MainViewController(presenter: presenter)
        
//        let presenter = ProfilePresenter()
//        window?.rootViewController = ProfileViewController(presenter: presenter)
        
//        let presenter = MatchedPresenter()
//        window?.rootViewController = MatchedViewController(presenter: presenter)
        
//        let presenter = PremiumPresenter()
//        window?.rootViewController = PremiumViewController(presenter: presenter)
        
        let presenter = ProfilePresenter()
        window?.rootViewController = ProfileViewController(presenter: presenter)
        
//        window?.rootViewController = TabbarController()
        
//        let presenter = MessagePresenter()
//        let splash = MessageViewController(presenter: presenter)
//        window?.rootViewController = splash

        window?.makeKeyAndVisible()
    }
}
