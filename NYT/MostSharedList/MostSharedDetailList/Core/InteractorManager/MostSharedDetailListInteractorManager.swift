//
//  MostSharedDetailListInteractorManager.swift
//  NYTProject
//
//  Created by Michel Goni on 12/02/2018.
//  Copyright (c) 2018, Michel Goni. All rights reserved.
//

import Foundation

protocol MostSharedDetailListInteractorManager {

    typealias detailCopletion = (NewsManaged?) -> Void
    func getNewDetail(completion: @escaping detailCopletion)
}
