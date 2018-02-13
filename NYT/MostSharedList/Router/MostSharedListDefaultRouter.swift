//
//  MostSharedListDefaultRouter.swift
//  NYTProject
//
//  Created by Michel Goni on 12/02/2018.
//  Copyright (c) 2018, Michel Goni. All rights reserved.
//

import UIKit

class MostSharedListDefaultRouter: MostSharedListRouter {
    weak var viewController: UIViewController?

    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    fileprivate func mostSharedListDetailBuilder() ->MostSharedDetailListBuilder {
        
        return Container.shared.mostSharedDetailListDefaultBuilder()
    }

    // MARK - Navigation funcions
    func navigateToNewDetail(withNewid newId: Int) {
        
        if let mostSharedListDetailViewController = self.mostSharedListDetailBuilder().buildMostSharedDetailListModule(withNewId: newId) {
            viewController?.navigationController?.pushViewController(mostSharedListDetailViewController, animated: true)
        }
    }
}
