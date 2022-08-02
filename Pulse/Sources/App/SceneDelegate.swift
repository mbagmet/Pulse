//
//  SceneDelegate.swift
//  Pulse
//
//  Created by Михаил Багмет on 29.07.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        // MARK: - TabBarController
        
        let tabBarController = UITabBarController()
        tabBarController.tabBar.itemPositioning = .centered
        tabBarController.tabBar.itemSpacing = 59
        
        // MARK: - window settings
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.makeKeyAndVisible()
        window?.rootViewController = tabBarController

        // MARK: - "Health" tab
        
        let healthViewController = HealthViewController()
        let healthNavigationController = UINavigationController(rootViewController: healthViewController)
        healthViewController.tabBarItem = UITabBarItem(title: CommonStrings.healthNavigationTitle,
                                                              image: UIImage(systemName: "heart.fill"),
                                                              tag: 0)

        // MARK: - "Profile" tab
        
        let profileViewController = ProfileViewController()
        let profileNavigationController = UINavigationController(rootViewController: profileViewController)
        profileViewController.tabBarItem = UITabBarItem(title: CommonStrings.profileNavigationTitle,
                                                       image: UIImage(systemName: "person.crop.circle.fill"),
                                                       tag: 1)

        // MARK: - TabBarController settings
        
        tabBarController.setViewControllers([
            healthNavigationController,
            profileNavigationController
        ], animated: true)

        tabBarController.selectedIndex = 0
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
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

        // Save changes in the application's managed object context when the application transitions to the background.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }
}
