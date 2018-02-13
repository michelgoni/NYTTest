//
//  Results+CoreDataProperties.swift
//  NYT
//
//  Created by Miguel Goñi on 13/2/18.
//  Copyright © 2018 Miguel Goñi. All rights reserved.
//
//

import Foundation
import CoreData


extension Results {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Results> {
        return NSFetchRequest<Results>(entityName: "Results")
    }

    @NSManaged public var results: Set<NewsManaged>?

}

// MARK: Generated accessors for results
extension Results {

    @objc(addResultsObject:)
    @NSManaged public func addToResults(_ value: NewsManaged)

    @objc(removeResultsObject:)
    @NSManaged public func removeFromResults(_ value: NewsManaged)

    @objc(addResults:)
    @NSManaged public func addToResults(_ values: NSSet)

    @objc(removeResults:)
    @NSManaged public func removeFromResults(_ values: NSSet)

}
