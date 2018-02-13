//
//  AppDelegate.swift
//  NYT
//
//  Created by Miguel Goñi on 13/2/18.
//  Copyright © 2018 Miguel Goñi. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
     
        let mainVC = MainViewController()
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = mainVC.createMainViewController()
        self.window?.backgroundColor = hexStringToUIColor(hex: Constants.Colors.TabBar.kTabBarYellowColor)
        self.window?.makeKeyAndVisible()
        
        return true
    }
}
