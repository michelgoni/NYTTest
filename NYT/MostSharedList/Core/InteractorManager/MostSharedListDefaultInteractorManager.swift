//
//  MostSharedListDefaultInteractorManager.swift
//  NYTProject
//
//  Created by Michel Goni on 12/02/2018.
//  Copyright (c) 2018, Michel Goni. All rights reserved.
//

import Foundation

final class MostSharedListDefaultInteractorManager {

    typealias resultsCompletion  = (Set<NewsManaged>?, _ error: String?) -> Void
    let dataProvider = LocalCoreDataService()
}

extension MostSharedListDefaultInteractorManager: MostSharedListInteractorManager {
    
    func getNews(withNewsFeed newsFeed: NewsFeed, completionHandler: @escaping MostSharedListDefaultInteractorManager.resultsCompletion) {
        
        dataProvider.getNews(withFeed: newsFeed, localHandler: { localNews, errorDescription in
            guard let localNews = localNews else {
                completionHandler(nil, errorDescription)
                return
            }
            completionHandler(localNews, nil)
        }) { remoteNews, errorDescription in
            
            guard let remoteNews = remoteNews else {
                completionHandler(nil, errorDescription)
                return
            }
            completionHandler(remoteNews, nil)
        }
    }
    
   
}
