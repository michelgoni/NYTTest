//
//  Media+CoreDataProperties.swift
//  NYT
//
//  Created by Miguel Goñi on 13/2/18.
//  Copyright © 2018 Miguel Goñi. All rights reserved.
//
//

import Foundation
import CoreData


extension Media {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Media> {
        return NSFetchRequest<Media>(entityName: "Media")
    }

    @NSManaged public var copyright: String?
    @NSManaged public var caption: String?
    @NSManaged public var mediametada: Set<Mediametadata>?

}

// MARK: Generated accessors for mediametada
extension Media {

    @objc(addMediametadaObject:)
    @NSManaged public func addToMediametada(_ value: Mediametadata)

    @objc(removeMediametadaObject:)
    @NSManaged public func removeFromMediametada(_ value: Mediametadata)

    @objc(addMediametada:)
    @NSManaged public func addToMediametada(_ values: NSSet)

    @objc(removeMediametada:)
    @NSManaged public func removeFromMediametada(_ values: NSSet)

}
