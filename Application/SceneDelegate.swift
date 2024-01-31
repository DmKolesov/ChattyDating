//
//  SceneDelegate.swift
//  ChattyDating
//
//  Created by admin on 31.01.2024.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = ViewController()    // In ViewController.swift
//        window?.rootViewController?.view.backgroundColor = .yellow  // So we can see it
        window?.makeKeyAndVisible()
    }

}

