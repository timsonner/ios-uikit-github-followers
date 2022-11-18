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
        // Create Navigation Controller(s)
        // Navigation controllers hold UIViewControllers.
        
        let searchNavigationController = createSearchNavigationController()
        let favoritesNavigationController = createFavoritesNavigationController()
        // Create a UITabViewController
       
        // Create an instance of UIWindowScene
        guard let windowScence = scene as? UIWindowScene else { return }
        // Create an instance of UIWindow
        window = UIWindow(frame: windowScence.coordinateSpace.bounds)
        // Set the windowScene of the UIWindow
        window?.windowScene = windowScence
        // Set the UIViewController of the UIWindow
        window?.rootViewController = createTabBar() // tabBarController is a type of UIViewController, now set as the root view controller.
        // Make the window scence visible
        window?.makeKeyAndVisible()
    }
    
    func createTabBar() -> UITabBarController {
        let tabBarController = UITabBarController()
        UITabBar.appearance().tintColor = .systemGreen
        // Feed the UITabBarController UIViewControllers.
        tabBarController.viewControllers = [createSearchNavigationController(), createFavoritesNavigationController()]
        return tabBarController
    }
    
    func createSearchNavigationController() -> UINavigationController {
        let viewController = SearchViewController()
        viewController.title = "Search"
        viewController.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "magnifyingglass"), tag: 0)
        return UINavigationController(rootViewController: viewController)
    }
    
    func createFavoritesNavigationController() -> UINavigationController {
        let viewController = FavoritesViewController()
        viewController.title = "Favorites"
        viewController.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "star"), tag: 0)
        return UINavigationController(rootViewController: viewController)
    }
    
    func createTabBar(){
        
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

