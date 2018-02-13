//
//  Constants.swift
//  NYT
//
//  Created by Miguel Goñi on 13/2/18.
//  Copyright © 2018 Miguel Goñi. All rights reserved.
//

import Foundation
import UIKit


struct Constants {
    
    struct Responses {
        
        static let okResponseFromServer = 200
    }
    
    struct TableCount {
        static let detailDataSourceNumberOfRows = 4
        static let newDetailDefaultRowCount = 1
        static let noAmount: Int = 0
    }
    
    struct Sizes {
        static let estimatedRowHeight : CGFloat = 100
    }
    
    struct TabBar {
        static let mostSharedTitle = "Most Shared"
        static let mostViewed = "Most Viewed"
        static let mostEmailed = "Most Emailed"
    }
    
    struct NavigationController {
        static let mostSharedTitle = "Most shared news"
        static let emptySharedTitle = ""
        static let mostViewedTitle = "Most viewed news"
        static let emptyMostViewedTitle = ""
        static let detailedNewTitle = "Detailed new"
    }
    
    struct EnPoint {
        static let apiKey = "api-key=32534511931e4dc1b5627b6918ca0d6b"
        static let base = "https://api.nytimes.com"
        static let mostShared  = "/svc/mostpopular/v2/mostshared/all-sections/1.json"
         static let mostSharedOneDay  = "/svc/mostpopular/v2/mostshared/all-sections/1.json"
         static let mostSharedSevenDays  = "/svc/mostpopular/v2/mostshared/all-sections/7.json"
         static let mostSharedThirtyDays  = "/svc/mostpopular/v2/mostshared/all-sections/30.json"
        
        
        static let mostEmailed = "svc/mostpopular/v2/mostemailed/all-sections/1.json"
         static let mostEmailedOneDay = "svc/mostpopular/v2/mostemailed/all-sections/1.json"
        static let mostEmailedSevenDays = "svc/mostpopular/v2/mostemailed/all-sections/7.json"
        static let mostEmailedThirtyDays = "svc/mostpopular/v2/mostemailed/all-sections/30.json"
        
        static let mostViewed =  "/svc/mostpopular/v2/mostviewed/all-sections/1.json"
        
        static let mostViewedOneDay =  "/svc/mostpopular/v2/mostviewed/all-sections/1.json"
        static let mostViewedSevenDays =  "/svc/mostpopular/v2/mostviewed/all-sections/7.json"
        static let mostViewedThirtyDays =  "/svc/mostpopular/v2/mostviewed/all-sections/30.json"
    }
    
    struct TimeSchedule {
        let oneDay = "1.json"
        let sevenDays = "7.json"
        let oneMonth = "30.json"
    }
    
    struct DetailListCells {
        static let cellTitle = "Title"
        static let cellSection = "Section"
        static let cellAbstract = "Abstract"
        static let cellUrl = "URL"
    }
    
    struct Colors {
        
        struct TabBar {
            static let kTabBarYellowColor = "F5B03B"
            static let kNonSelectedItemColor = "333333"
        }
    }
}
