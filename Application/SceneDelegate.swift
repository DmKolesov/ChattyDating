
import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.windowScene = windowScene
        let presenter = SplashPresenter()
        window?.rootViewController = SplashScreenViewController(presenter: presenter)
//        window?.rootViewController = RegisterViewController()
        window?.makeKeyAndVisible()
    }

}

