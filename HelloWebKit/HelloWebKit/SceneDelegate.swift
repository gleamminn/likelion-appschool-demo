//
//  SceneDelegate.swift
//  HelloWebKit
//
//  Created by Jongwook Park on 8/16/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let simpleViewController = SimpleViewController()
        simpleViewController.tabBarItem = UITabBarItem(title: "Simple", image: UIImage(systemName: "heart.text.square"), tag: 0)
        
        let lionViewController = LionViewController()
        lionViewController.tabBarItem = UITabBarItem(title: "Lion", image: UIImage(systemName: "laptopcomputer.and.iphone"), tag: 1)
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [simpleViewController, lionViewController]
        
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

