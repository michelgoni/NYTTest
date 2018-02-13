//
//  NewsManaged+CoreDataClass.swift
//  NYT
//
//  Created by Goñi Irigoyen, Michel on 13/2/18.
//  Copyright © 2018 Miguel Goñi. All rights reserved.
//
//

import Foundation
import CoreData

@objc(NewsManaged)
public class NewsManaged: NSManagedObject, Decodable, Managed {
    
    required convenience public init(from decoder: Decoder) throws {
        
        let context = CoreDataStack.sharedInstance.persistentContainer.viewContext
        guard let entity = NSEntityDescription.entity(forEntityName: NewsManaged.entityName, in: context) else { fatalError("No valid entity") }
        self.init(entity: entity, insertInto: context)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.url = try container.decodeIfPresent(String.self, forKey: .url)
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
        self.abstract = try container.decodeIfPresent(String.self, forKey: .abstract)
        self.section = try container.decodeIfPresent(String.self, forKey: .section)
        self.newId = try container.decode(Int64.self, forKey: .newId)
        self.date = try container.decodeIfPresent(String.self, forKey: .date)
        
        if let mediaFromRemote = try? container.decodeIfPresent([Media].self, forKey: .media) {
            
            self.media = Set(mediaFromRemote!)
            
        }else{
            self.media = nil
        }
    }
}

extension NewsManaged: Encodable {
    
    enum CodingKeys: String, CodingKey {
        
        case newId = "asset_id"
        case date = "published_date"
        case url, title, abstract, section, media
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(url, forKey: .url)
        try container.encode(title, forKey: .title)
        try container.encode(abstract, forKey: .abstract)
        try container.encode(section, forKey: .section)
        try container.encode(date, forKey: .date)
        try container.encode(newId, forKey: .newId)
        guard let resultUnwrapped = media else { return  }
        let mediaArray = Array(resultUnwrapped)
        try container.encode(mediaArray, forKey: .media)
    }
}
