//
//  UINavigationController+Extension.swift
//  NYT
//
//  Created by Miguel Goñi on 13/2/18.
//  Copyright © 2018 Miguel Goñi. All rights reserved.
//

import UIKit

extension UINavigationController {
    
    func configureNavigationController() {
        
        self.navigationBar.barTintColor = hexStringToUIColor(hex: Constants.Colors.TabBar.kTabBarYellowColor)
        self.navigationBar.tintColor =  hexStringToUIColor(hex: Constants.Colors.TabBar.kNonSelectedItemColor)
    }
}

extension UITabBarController {
    
  func configureTabBarAppearance (){
        
        self.tabBar.barTintColor = hexStringToUIColor(hex: Constants.Colors.TabBar.kTabBarYellowColor)
        self.tabBar.tintColor = hexStringToUIColor(hex: Constants.Colors.TabBar.kNonSelectedItemColor)
    }
    
    func centerVerticallyTabBarItems()  {
        
        if let items = tabBar.items {
            
            for item in items {
                item.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0)
            }
        }
    }
}
