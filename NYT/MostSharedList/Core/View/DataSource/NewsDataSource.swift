//
//  NewsDataSource.swift
//  NYT
//
//  Created by Goñi Irigoyen, Michel on 13/2/18.
//  Copyright © 2018 Miguel Goñi. All rights reserved.
//

import Foundation
import UIKit

protocol NewidProtocol {
    func sendId(newId: Int)
}

class NewsDataSource: NSObject {
    
    private var news: MostSharedListViewModel?
    var newId: Int?
    var delegate: NewidProtocol?
   
    func setNews(withNew news: MostSharedListViewModel) {
        self.news = news
    }
}

extension NewsDataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news?.mostSharedListViewModel.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as MostSharedListTableViewCell
        cell.setUp(news?.mostSharedListViewModel[indexPath.row])
        return cell
    }
}

extension NewsDataSource: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let idUnwrapped = news?.mostSharedListViewModel[indexPath.row].newId else { return  }
        
        delegate?.sendId(newId: idUnwrapped)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}
