//
//  MostViewedDataSource.swift
//  NYT
//
//  Created by Goñi Irigoyen, Michel on 12/02/2018.
//  Copyright © 2018 Miguel Goñi. All rights reserved.
//

import UIKit

final class MostViewedDataSource: NSObject {
    private var news: MostViewedListViewModel?
    var newId: Int?
    var delegate: NewidProtocol?
    
    func setNews(withNew news: MostViewedListViewModel) {
        self.news = news
    }
}

extension MostViewedDataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news?.mostViewedListViewModel.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as MostViewedListTableViewCell
        cell.setUp(news?.mostViewedListViewModel[indexPath.row])
        return cell
    }
}

extension MostViewedDataSource: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //MARK:--Same as before: get from local newId and inject it into the delegate 
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}
