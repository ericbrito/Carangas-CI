//
//  AppDelegate.swift
//  Carangas
//
//  Copyright © 2020 Eric Brito. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
	var appCoordinator: AppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
		
		window = UIWindow(frame: UIScreen.main.bounds)
		appCoordinator = AppCoordinator()
		window?.rootViewController = appCoordinator?.navigationController
		window?.makeKeyAndVisible()
		appCoordinator?.start()
		window?.tintColor = UIColor(named: "main")
        return true
    }
}

