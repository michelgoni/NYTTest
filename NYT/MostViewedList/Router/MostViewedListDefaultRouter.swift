//
//  MostViewedListDefaultRouter.swift
//  NYT
//
//  Created by Michel Goni on 12/02/2018.
//  Copyright (c) 2018, Personal. All rights reserved.
//

import UIKit

class MostViewedListDefaultRouter: MostViewedListRouter {
    weak var viewController: UIViewController?

    init(viewController: UIViewController) {
        self.viewController = viewController
    }


}
