//
//  SceneDelegate.swift
//  Github Followers
//
//  Created by Timothy Sonner on 11/13/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    // Conform to UISceneDelegate protocol by implementing func scene().
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // MARK: Setup for programatic UI
        
        // Create Navigation Controller(s)
        // MARK: Create a UITabViewController
        // Create an instance of UIWindowScene.
        guard let windowScence = scene as? UIWindowScene else { return }
        // Create an instance of a UIWindow.
        window = UIWindow(frame: windowScence.coordinateSpace.bounds) // fills entire screen
        // Set the windowScene of the UIWindow instance.
        window?.windowScene = windowScence
        // Set the UIViewController of the UIWindow.
        window?.rootViewController = createTabBarController() // tabBarController is a type of UIViewController, now set as the root view controller.
        // Make the window scence visible.
        window?.makeKeyAndVisible()
    }
    
    func createTabBarController() -> UITabBarController {
        let tabBarController = UITabBarController()
        // Set app wide appearance of UITabBar
        UITabBar.appearance().tintColor = .systemGreen
        // Pass the UITabBarController an array of UIViewControllers.
        tabBarController.viewControllers = [createSearchNavigationController(), createFavoritesNavigationController()]
        return tabBarController
    }
    
    func createSearchNavigationController() -> UINavigationController {
        let viewController = SearchViewController()
        viewController.title = "Search"
        viewController.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 0)
        return UINavigationController(rootViewController: viewController)
    }
    
    func createFavoritesNavigationController() -> UINavigationController {
        let viewController = FavoritesViewController()
        viewController.title = "Favorites"
        viewController.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(systemName: "star"), tag: 0)
        return UINavigationController(rootViewController: viewController)
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

