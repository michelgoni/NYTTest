//
//  NewsManaged+CoreDataProperties.swift
//  NYT
//
//  Created by Goñi Irigoyen, Michel on 13/2/18.
//  Copyright © 2018 Miguel Goñi. All rights reserved.
//
//

import Foundation
import CoreData


extension NewsManaged {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NewsManaged> {
        return NSFetchRequest<NewsManaged>(entityName: "News")
    }

    @NSManaged public var abstract: String?
    @NSManaged public var date: String?
    @NSManaged public var section: String?
    @NSManaged public var title: String?
    @NSManaged public var url: String?
    @NSManaged public var newId: Int64  //TODO:-- It should be changed to Int32
    @NSManaged public var media: Set<Media>?
}

// MARK: Generated accessors for media
extension NewsManaged {

    @objc(addMediaObject:)
    @NSManaged public func addToMedia(_ value: Media)

    @objc(removeMediaObject:)
    @NSManaged public func removeFromMedia(_ value: Media)

    @objc(addMedia:)
    @NSManaged public func addToMedia(_ values: NSSet)

    @objc(removeMedia:)
    @NSManaged public func removeFromMedia(_ values: NSSet)

}
