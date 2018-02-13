//
//  MostSharedListInteractorManager.swift
//  NYTProject
//
//  Created by Michel Goni on 12/02/2018.
//  Copyright (c) 2018, Michel Goni. All rights reserved.
//

import Foundation


protocol MostSharedListInteractorManager {

    func getNews(withNewsFeed newsFeed: NewsFeed, completionHandler: @escaping MostSharedListDefaultInteractorManager.resultsCompletion)
}
