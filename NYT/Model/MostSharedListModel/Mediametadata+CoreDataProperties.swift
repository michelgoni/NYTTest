//
//  Mediametadata+CoreDataProperties.swift
//  NYT
//
//  Created by Miguel Goñi on 13/2/18.
//  Copyright © 2018 Miguel Goñi. All rights reserved.
//
//

import Foundation
import CoreData

extension Mediametadata {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Mediametadata> {
        return NSFetchRequest<Mediametadata>(entityName: "Mediametadata")
    }
    @NSManaged public var url: String?
}
