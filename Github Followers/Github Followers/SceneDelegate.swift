//
//  SceneDelegate.swift
//  Github Followers
//
//  Created by Timothy Sonner on 11/13/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // MARK: Setup for programatic UI
        // Create an instance of UIWindowScene
        guard let windowScence = scene as? UIWindowScene else { return }
        // Create an instance of UIWindow
        window = UIWindow(frame: windowScence.coordinateSpace.bounds)
        // Set the windowScene of the UIWindow
        window?.windowScene = windowScence
        // Set the UIViewController of the UIWindow
        window?.rootViewController = ViewController()
        // Make the window scence visible
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {

    }

    func sceneDidBecomeActive(_ scene: UIScene) {

    }

    func sceneWillResignActive(_ scene: UIScene) {

    }

    func sceneWillEnterForeground(_ scene: UIScene) {
      
    }

    func sceneDidEnterBackground(_ scene: UIScene) {

    }


}

