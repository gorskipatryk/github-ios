//
//  AppDelegate.swift
//  tumblr
//
//  Created by Patryk Górski on 06/12/2018.
//  Copyright © 2018 Patryk Górski. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    private let navigationController: UINavigationController = UINavigationController()
    
    lazy var window: UIWindow? = {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.makeKeyAndVisible()
        window.rootViewController = navigationController
        return window
    }()
    
    private lazy var coordinator: Coordinator = {
        guard let navigationController = window?.rootViewController as? UINavigationController else {
            fatalError("Window's root view controller is of unexpected type.")
        }
        let coordinator = AppCoordinator(services: Services(), parentNavigationController: navigationController)
        return coordinator
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        coordinator.start()
        return true
    }
}
