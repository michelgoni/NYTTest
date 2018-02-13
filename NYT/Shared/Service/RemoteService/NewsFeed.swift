//
//  NewsFeed.swift
//  NYT
//
//  Created by Miguel Goñi on 13/2/18.
//  Copyright © 2018 Miguel Goñi. All rights reserved.
//

import Foundation

enum NewsFeed {
    
  
    case mostShared,mostEmailed,mostViewed
    
}



extension NewsFeed: Endpoint {
  
    var base: String {
        return Constants.EnPoint.base
    }
    
    
    var path: String {

        switch self {
        case .mostShared:

            return Constants.EnPoint.mostShared
        case .mostEmailed:
            return Constants.EnPoint.mostEmailed
        case .mostViewed:
            return Constants.EnPoint.mostViewed
        }
    }
}


