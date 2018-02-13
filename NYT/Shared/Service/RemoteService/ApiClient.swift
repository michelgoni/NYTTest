//
//  ApiClient.swift
//  NYT
//
//  Created by Miguel Goñi on 13/2/18.
//  Copyright © 2018 Miguel Goñi. All rights reserved.
//

import Foundation

class NewsApiClient {
    
    typealias feedCompletion = (Result<Results?, ApiError>) -> Void
    let session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
}

extension NewsApiClient: ApiClient {
    
     func getFeed(from newsFeedType: NewsFeed, completion: @escaping feedCompletion) {
    
        let endpoint = newsFeedType
        let request = endpoint.request
        
        fetch(with: request, decode: { json -> Results? in
            guard let newsResult = json as? Results else { return  nil }
            return newsResult
        }, completion: completion)
        
    }
}
