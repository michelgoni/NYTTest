//
//  Mediametadata+CoreDataClass.swift
//  NYT
//
//  Created by Miguel Goñi on 13/2/18.
//  Copyright © 2018 Miguel Goñi. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Mediametadata)
public class Mediametadata: NSManagedObject, Decodable, Managed {

    required convenience public init(from decoder: Decoder) throws {
         let context = CoreDataStack.sharedInstance.persistentContainer.viewContext
        guard let entity = NSEntityDescription.entity(forEntityName: Mediametadata.entityName, in: context) else { fatalError("No valid entity") }
        self.init(entity: entity, insertInto: context)
        
         let container = try decoder.container(keyedBy: CodingKeys.self)
         self.url = try container.decodeIfPresent(String.self, forKey: .url)
    }
}

extension Mediametadata: Encodable {
    enum CodingKeys: String, CodingKey {
        
        case url
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(url, forKey: .url)
    }
}
