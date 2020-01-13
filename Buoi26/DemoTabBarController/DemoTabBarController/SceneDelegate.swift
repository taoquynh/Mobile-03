//
//  SceneDelegate.swift
//  DemoTabBarController
//
//  Created by Taof on 1/13/20.
//  Copyright © 2020 Taof. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = setupTabBarController()
        window?.makeKeyAndVisible()
    }

    func setupTabBarController() -> UITabBarController {
        let tabBC = UITabBarController()
//        tabBC.tabBar.barTintColor = UIColor.orange
        // Khởi tạo màn 1
        let screen1 = MainScreen1()
        let navigation1 = UINavigationController(rootViewController: screen1)
        screen1.view.backgroundColor = UIColor.lightGray
        navigation1.tabBarItem = UITabBarItem(title: "Message", image: UIImage(named: "chat-gray"), tag: 0)
        navigation1.tabBarItem.badgeValue = "5"
        
        let screen2 = MainScreen2()
        screen2.view.backgroundColor = UIColor.cyan
//        screen2.tabBarItem = UITabBarItem(title: "Contact", image: UIImage(named: "contacts-gray"), tag: 1)
        screen2.tabBarItem = UITabBarItem(title: "Contact", image: UIImage(named: "contacts-gray"), selectedImage: UIImage(named: "watch-blue"))
        
        let screen3 = MainScreen3()
        screen3.view.backgroundColor = UIColor.yellow
        screen3.tabBarItem = UITabBarItem(title: "Group", image: UIImage(named: "people-gray"), tag: 2)
        
        let screen4 = MainScreen4()
        screen4.view.backgroundColor = UIColor.red
        screen4.tabBarItem = UITabBarItem(title: "Diary", image: UIImage(named: "watch-gray"), tag: 3)
        
        let screen5 = MainScreen5()
        screen5.view.backgroundColor = UIColor.green
        screen5.tabBarItem = UITabBarItem(title: "User", image: UIImage(named: "grid-gray"), tag: 4)
        tabBC.setViewControllers([navigation1, screen2, screen3, screen4, screen5], animated: true)
        return tabBC
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

