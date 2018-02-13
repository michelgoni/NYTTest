//
//  LocalService.swift
//  NYT
//
//  Created by Goñi Irigoyen, Michel on 13/2/18.
//  Copyright © 2018 Miguel Goñi. All rights reserved.
//

import Foundation
import CoreData

final class LocalCoreDataService {

    let stack = CoreDataStack.sharedInstance
    typealias resultsCompletion  = (Set<NewsManaged>?, _ error: String?) -> Void
    private let client = NewsApiClient()
    
    func getNews(withFeed feed: NewsFeed, localHandler: @escaping resultsCompletion, remoteHandler: @escaping resultsCompletion) {
        
        localHandler(getNewsfromLocal()!, nil)
        
        client.getFeed(from: feed) { [unowned self] result in
            
            switch result {
                
            case .success(let newsFeedResult):
                
                guard let newsResults = newsFeedResult?.results else {return}
               
                remoteHandler(newsResults,nil)
                
                 //TODO:--This logic should be improved, since we´re only saving mostShared news in order to push correctly to a detailed new from the mostSharedVC.
                switch feed {
                case .mostShared:
                    self.stack.persistentContainer.viewContext.deletePreviousNews()
                    self.stack.persistentContainer.viewContext.insertNews()
                case .mostEmailed, .mostViewed:
                    break
                }
                
               
            case .failure(let error):
                print("Yikes!!! There´s some short of error: \(error.localizedDescription)")
                remoteHandler(nil, error.localizedDescription)
            }
        }
    }

    private func getNewsfromLocal() -> Set<NewsManaged>? {
        
        let  context = self.stack.persistentContainer.viewContext
        let request: NSFetchRequest<NewsManaged> = NewsManaged.fetchRequest()
        
        do {
            let results = try context.fetch(request)
            var newsResults = [NewsManaged]()
            for managedNew in results {
                
                newsResults.append(managedNew)
            }
            return Set(newsResults)
        } catch {
            print(error.localizedDescription)
            print("error getting shared news from Corde Data")
        }
        
        return nil
    }
    
     func getSelectedNewForDetailViewController (newId: Int64) -> NewsManaged? {
        
        let  context = self.stack.persistentContainer.viewContext
        let request: NSFetchRequest<NewsManaged> = NewsManaged.fetchRequest()
        let predicate = NSPredicate(format: "newId = \(newId)")
        request.predicate = predicate
        do {
            let fetchedNews = try context.fetch(request)
            
            if fetchedNews.count > Constants.TableCount.noAmount {
                
                return fetchedNews.last
            }else{
                return nil
            }
        }
        catch {
            print("error getting data from Core Data")
            return nil
        }
    }
}
