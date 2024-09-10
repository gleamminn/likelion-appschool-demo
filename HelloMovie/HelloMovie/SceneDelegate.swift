//
//  SceneDelegate.swift
//  HelloMovie
//
//  Created by Jongwook Park on 8/13/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        var viewContollers: [UIViewController] = []
        
        for (index, publisher) in Publisher.allCases.enumerated() {
            let viewContorller = MoviesTableViewController()
            viewContorller.updateMovies(publisher)
            
            let navigationController = UINavigationController(rootViewController: viewContorller)
            navigationController.tabBarItem = UITabBarItem(title: "\(publisher.rawValue)", image: UIImage(systemName: "star"), tag: index)
            
            viewContollers.append(navigationController)
        }
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = viewContollers
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = tabBarController
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

