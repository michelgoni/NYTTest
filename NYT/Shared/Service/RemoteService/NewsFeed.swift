//
//  NewsFeed.swift
//  NYT
//
//  Created by Miguel Goñi on 13/2/18.
//  Copyright © 2018 Miguel Goñi. All rights reserved.
//

import Foundation

//Time to refactor this enum extending from Int in order to get selected path
enum NewsFeed: Int {
    
    case mostSharedOneDay, mostViewedOneDay
    
}

extension NewsFeed: Endpoint {
  
    var base: String {
        return Constants.EnPoint.base
    }
    
    
    var path: String {

        switch self {
        case .mostSharedOneDay:
            return Constants.EnPoint.mostSharedOneDay

        case .mostViewedOneDay:
            return Constants.EnPoint.mostViewedOneDay

        }
    }
}


