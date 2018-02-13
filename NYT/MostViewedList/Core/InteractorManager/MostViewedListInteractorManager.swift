//
//  MostViewedListInteractorManager.swift
//  NYT
//
//  Created by Michel Goni on 12/02/2018.
//  Copyright (c) 2018, Personal. All rights reserved.
//

import Foundation

protocol MostViewedListInteractorManager {
    
    func getNews(completionHandler: @escaping MostSharedListDefaultInteractorManager.resultsCompletion)
}
