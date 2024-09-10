//
//  SceneDelegate.swift
//  HelloPlus
//
//  Created by Jongwook Park on 8/13/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        /*
        let viewController1 = ViewController()
        // viewController1.setNumber(1)
        viewController1.number = 1
        let navigationController1 = UINavigationController(rootViewController: viewController1)
        navigationController1.tabBarItem = UITabBarItem(title: "+1", image: UIImage(systemName: "1.circle"), tag: 0)
        
        let viewController2 = ViewController()
        // viewController2.setNumber(2)
        viewController2.number = 2
        let navigationController2 = UINavigationController(rootViewController: viewController2)
        navigationController2.tabBarItem = UITabBarItem(title: "+2", image: UIImage(systemName: "2.circle"), tag: 0)
        
        let viewController3 = ViewController()
        // viewController3.setNumber(2)
        viewController3.number = 3
        let navigationController3 = UINavigationController(rootViewController: viewController3)
        navigationController3.tabBarItem = UITabBarItem(title: "+3", image: UIImage(systemName: "3.circle"), tag: 0)
         
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [navigationController1, navigationController2, navigationController3]
        */
        
        
        var viewControllers: [UIViewController] = []
        
        let colors: [UIColor] = [.black, .orange, .purple, .magenta]
        
        for index in 1...3 {
            let viewController = ViewController()
            viewController.number = index
            viewController.themeColor = colors[index]
            let navigationController = UINavigationController(rootViewController: viewController)
            navigationController.tabBarItem = UITabBarItem(title: "+\(index)", image: UIImage(systemName: "\(index).circle"), tag: index)
            
            viewControllers.append(navigationController)
        }
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = viewControllers
        
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

