//
//  AppDelegate.swift
//  SaryTask
//
//  Created by mohamed shera on 28/04/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private var coordinator: Coordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // create the main navigation controller to be used for our app
        let navigationController = UINavigationController()
        
        // send that into our coordinator so that it can display view controllers
        coordinator = AppCoordinator(navigationController)
        
        // tell the coordinator to take over control
        coordinator?.start()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }
}

