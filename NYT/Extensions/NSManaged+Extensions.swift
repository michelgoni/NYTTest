//
//  NSManaged+Extensions.swift
//  NYT
//
//  Created by Miguel Goñi on 13/2/18.
//  Copyright © 2018 Miguel Goñi. All rights reserved.
//

import Foundation

import CoreData

public protocol Managed: class {
    static var entityName: String { get }
}

public extension Managed where Self: NSManagedObject {
    public static var entityName: String { return entity().name! }
}


//public extension CodingUserInfoKey {
//    public static let context = CodingUserInfoKey(rawValue: "context")!
//}

public extension NSManagedObjectContext {

    //MARK:--Cool way to check how many elements are left to save
    public var pendingToSave: Int {
        return self.insertedObjects.count
    }
    
    public func insertNews() {
        
        let context = CoreDataStack.sharedInstance.persistentContainer.viewContext
        guard let entity = NSEntityDescription.entity(forEntityName: Results.entityName, in: context) else { fatalError("No valid entity") }
        let _ = Results(entity: entity, insertInto: context)
        
        do {
            try context.save()
        }catch{
            print("Error updating data")
        }
    }
    
    public func deletePreviousNews() {
        
        let context = CoreDataStack.sharedInstance.persistentContainer.viewContext
       
        let resultsFetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Results")
        let newsfetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "News")
        let mediafetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Media")
        let mediaMetadatafetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Mediametadata")
        
        let resultsDeleteRequest = NSBatchDeleteRequest(fetchRequest: resultsFetchRequest)
        let newsDeleteRequest = NSBatchDeleteRequest(fetchRequest: newsfetchRequest)
        let mediaDeleteRequest = NSBatchDeleteRequest(fetchRequest: mediafetchRequest)
        let mediaMetadataDeleteRequest = NSBatchDeleteRequest(fetchRequest: mediaMetadatafetchRequest)
        
        do {
            try context.execute(resultsDeleteRequest)
            try context.execute(newsDeleteRequest)
            try context.execute(mediaDeleteRequest)
            try context.execute(mediaMetadataDeleteRequest)
            
        } catch {
            print("There was some error trying to delete context: \(error)")
        }
    }
}
