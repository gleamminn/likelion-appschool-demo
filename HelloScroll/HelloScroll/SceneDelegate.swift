//
//  SceneDelegate.swift
//  HelloScroll
//
//  Created by Jongwook Park on 8/19/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let boardViewController = BoardViewController()
        boardViewController.tabBarItem = UITabBarItem(title: "Board", image: UIImage(systemName: "checkerboard.rectangle"), tag: 0)
        
        let wideWideViewController = WideWideViewController()
        wideWideViewController.tabBarItem = UITabBarItem(title: "Wide", image: UIImage(systemName: "field.of.view.ultrawide"), tag: 1)
        
        let alphabetViewController = AlphabetViewController()
        alphabetViewController.tabBarItem = UITabBarItem(title: "Alphabet", image: UIImage(systemName: "abc"), tag: 2)
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [boardViewController, wideWideViewController, alphabetViewController]
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) { }

    func sceneDidBecomeActive(_ scene: UIScene) { }

    func sceneWillResignActive(_ scene: UIScene) { }

    func sceneWillEnterForeground(_ scene: UIScene) { }

    func sceneDidEnterBackground(_ scene: UIScene) { }
}

