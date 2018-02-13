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
    
    case mostSharedOneDay = 0, mostSharedSevenDays, mostSharedThirtyDays, mostEmailedOneDay, mostEmailedSevenDays, mostEmailedThirtyDays, mostViewedOneDay, mostViewedSevenDays, mostViewedThirtyDays
   // case mostShared,mostEmailed,mostViewed
    
}



extension NewsFeed: Endpoint {
  
    var base: String {
        return Constants.EnPoint.base
    }
    
    
    var path: String {

        switch self {
        case .mostSharedOneDay:
            return Constants.EnPoint.mostShared
        case .mostSharedSevenDays:
            return Constants.EnPoint.mostShared
        case .mostSharedThirtyDays:
            return Constants.EnPoint.mostShared
        case .mostEmailedOneDay:
            return Constants.EnPoint.mostShared
        case .mostEmailedSevenDays:
            return Constants.EnPoint.mostShared
        case .mostEmailedThirtyDays:
            return Constants.EnPoint.mostShared
        case .mostViewedOneDay:
            return Constants.EnPoint.mostShared
        case .mostViewedSevenDays:
            return Constants.EnPoint.mostShared
        case .mostViewedThirtyDays:
            return Constants.EnPoint.mostShared
//        case .mostShared:
//
//            return Constants.EnPoint.mostShared
//        case .mostEmailed:
//            return Constants.EnPoint.mostEmailed
//        case .mostViewed:
//            return Constants.EnPoint.mostViewed
//        }
    }
}


