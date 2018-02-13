//
//  Results+CoreDataClass.swift
//  NYT
//
//  Created by Miguel Goñi on 13/2/18.
//  Copyright © 2018 Miguel Goñi. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Results)
public class Results: NSManagedObject, Decodable, Managed {
    
    required convenience public init(from decoder: Decoder) throws {
        
        let context = CoreDataStack.sharedInstance.persistentContainer.viewContext

        guard let entity = NSEntityDescription.entity(forEntityName: Results.entityName, in: context) else { fatalError("No valid entity") }
        self.init(entity: entity, insertInto: context)
        
         let container = try decoder.container(keyedBy: CodingKeys.self)
        if let resultsFromRemote = try container.decodeIfPresent([NewsManaged].self, forKey: .results) {
            self.results = Set(resultsFromRemote)
        }
    }
}

extension Results: Encodable {
    
    enum CodingKeys: String, CodingKey {
        
        case results
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        guard let resultUnwrapped = results else { return  }
        let result = Array(resultUnwrapped)
        try container.encode(result, forKey: .results)
    }
}
