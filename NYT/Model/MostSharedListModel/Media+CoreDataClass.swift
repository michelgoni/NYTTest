//
//  Media+CoreDataClass.swift
//  NYT
//
//  Created by Miguel Goñi on 13/2/18.
//  Copyright © 2018 Miguel Goñi. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Media)
public class Media: NSManagedObject, Decodable, Managed {

    required convenience public init(from decoder: Decoder) throws {
        
         let context = CoreDataStack.sharedInstance.persistentContainer.viewContext
      
        guard let entity = NSEntityDescription.entity(forEntityName: Media.entityName, in: context) else { fatalError("No valid entity") }
        self.init(entity: entity, insertInto: context)
         let container = try decoder.container(keyedBy: CodingKeys.self)
         self.copyright = try container.decodeIfPresent(String.self, forKey: .copyright)
        self.caption = try container.decodeIfPresent(String.self, forKey: .caption)
        
        if let mediaMetadataFomRemote = try container.decodeIfPresent([Mediametadata].self, forKey: .mediametadata) {
            self.mediametada = Set(mediaMetadataFomRemote)
        }
    }
}

extension Media: Encodable {
    
    enum CodingKeys: String, CodingKey {
        
        case mediametadata = "media-metadata"
        case copyright, caption
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(copyright, forKey: .copyright)
        try container.encode(caption, forKey: .caption)
        guard let mediaMetadataUnwrapped = mediametada else { return  }
        let mediaMetadataArray = Array(mediaMetadataUnwrapped)
        try container.encode(mediaMetadataArray, forKey: .mediametadata)
    
    }
}
