//
//  MostSharedDetailListBuilder.swift
//  NYTProject
//
//  Created by Michel Goni on 12/02/2018.
//  Copyright (c) 2018, Michel Goni. All rights reserved.
//

import UIKit

protocol MostSharedDetailListBuilder {
    
    func buildMostSharedDetailListModule(withNewId newId: Int) -> UIViewController?
}
