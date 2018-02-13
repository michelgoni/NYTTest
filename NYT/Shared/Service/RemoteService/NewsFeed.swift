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
    
    case mostSharedOneDay, mostSharedSevenDays, mostSharedThirtyDays, mostEmailedOneDay, mostEmailedSevenDays, mostEmailedThirtyDays, mostViewedOneDay, mostViewedSevenDays, mostViewedThirtyDays
    
}



extension NewsFeed: Endpoint {
  
    var base: String {
        return Constants.EnPoint.base
    }
    
    
    var path: String {

        switch self {
        case .mostSharedOneDay:
            return Constants.EnPoint.mostSharedOneDay
        case .mostSharedSevenDays:
            return Constants.EnPoint.mostSharedSevenDays
        case .mostSharedThirtyDays:
            return Constants.EnPoint.mostSharedThirtyDays
        case .mostEmailedOneDay:
            return Constants.EnPoint.mostEmailedOneDay
        case .mostEmailedSevenDays:
            return Constants.EnPoint.mostEmailedSevenDays
        case .mostEmailedThirtyDays:
            return Constants.EnPoint.mostEmailedThirtyDays
        case .mostViewedOneDay:
            return Constants.EnPoint.mostViewedOneDay
        case .mostViewedSevenDays:
            return Constants.EnPoint.mostViewedSevenDays
        case .mostViewedThirtyDays:
            return Constants.EnPoint.mostViewedThirtyDays
        }
    }
}


