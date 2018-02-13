//
//  MainViewController.swift
//  NYT
//
//  Created by Miguel Goñi on 13/2/18.
//  Copyright © 2018 Miguel Goñi. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func createMainViewController () -> UITabBarController {
    
        //MARK:--Most shared  list
        let mostSharedViewController = Container.shared.mostSharedListBuilder().buildMostSharedListModule()
        mostSharedViewController?.tabBarItem = UITabBarItem(title: Constants.TabBar.mostSharedTitle,image: UIImage(named: "tv-icon"),tag: 1)
        let mostSharedNavigationController = UINavigationController(rootViewController: mostSharedViewController!)
         mostSharedNavigationController.configureNavigationController()
        
        //MARK:--Most viewedList
        let mostViewedViewController = Container.shared.mostViewedListBuilder().buildMostViewedListModule()
        mostViewedViewController?.tabBarItem = UITabBarItem(title: Constants.TabBar.mostViewed,image: UIImage(named: "towatch-icon"),tag: 2)
        let mostViewedNavigationController = UINavigationController(rootViewController: mostViewedViewController!)
        mostViewedNavigationController.configureNavigationController()
        
        //MARK:--Most emailed. Only for stub purpose
        let mostEmailedViewController = Container.shared.mostViewedListBuilder().buildMostViewedListModule()
        mostEmailedViewController?.tabBarItem = UITabBarItem(title: Constants.TabBar.mostEmailed,image: UIImage(named: "towatch-icon"),tag: 3)
        let mostEmailedNavigationController = UINavigationController(rootViewController: mostEmailedViewController!)
        mostEmailedNavigationController.configureNavigationController()
        
        let tabBarViewController = MainViewController()
        
        // MARK: Appearance config
        tabBarViewController.configureTabBarAppearance()
        tabBarViewController.centerVerticallyTabBarItems()
        tabBarViewController.viewControllers = [mostSharedNavigationController, mostViewedNavigationController, mostEmailedNavigationController]
        
        return tabBarViewController
    }
}
