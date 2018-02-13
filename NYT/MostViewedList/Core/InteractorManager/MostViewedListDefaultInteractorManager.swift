//
//  MostViewedListDefaultInteractorManager.swift
//  NYT
//
//  Created by Michel Goni on 12/02/2018.
//  Copyright (c) 2018, Personal. All rights reserved.
//

import Foundation

final class MostViewedListDefaultInteractorManager {

    let dataProvider = LocalCoreDataService()
}

extension MostViewedListDefaultInteractorManager: MostViewedListInteractorManager {
   
    func getNews(completionHandler: @escaping MostSharedListDefaultInteractorManager.resultsCompletion) {
        
        
        dataProvider.getNews(withFeed: .mostViewed, localHandler: { (localNews, errorDescription) in
            guard let localNews = localNews else {
                completionHandler(nil, errorDescription)
                return
            }
            completionHandler(localNews, nil)
        }) { (remoteNews, errorDescription) in
            guard let remoteNews = remoteNews else {
                completionHandler(nil, errorDescription)
                return
            }
            completionHandler(remoteNews, nil)
        }
    }
}
