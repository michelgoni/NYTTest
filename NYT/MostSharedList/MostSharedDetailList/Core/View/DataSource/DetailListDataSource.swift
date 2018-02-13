//
//  DetailListDataSource.swift
//  NYT
//
//  Created by Goñi Irigoyen, Michel on 13/2/18.
//  Copyright © 2018 Miguel Goñi. All rights reserved.
//

import Foundation
import UIKit

final class DetailDataSource: NSObject {
    
    private var detailNew: MostSharedDetailListViewModel?
    
    func setDetailNew(detailNew new: MostSharedDetailListViewModel) {
        detailNew = new
    }
}

extension DetailDataSource: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Constants.TableCount.detailDataSourceNumberOfRows
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        guard let rowCount = detailNew?.detailListViewModel[section].rowCount else { return 1 }
        return rowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let new = detailNew?.detailListViewModel[indexPath.section]{

            switch new.type {
            case .titleAndPicture:
                if let cell = tableView.dequeueReusableCell(withIdentifier: TitleCell.reuseIdentifier) as? TitleCell {
                   cell.detailSection = new
                    return cell
                }
            case .section:
                if let cell = tableView.dequeueReusableCell(withIdentifier: SectionCell.reuseIdentifier) as? SectionCell {
                    cell.detailSection = new
                    return cell
                }
            case .abstract:
                if let cell = tableView.dequeueReusableCell(withIdentifier: AbstractCell.reuseIdentifier) as? AbstractCell {
                    cell.detailSection = new
                    return cell
                }
            case .url:
                if let cell = tableView.dequeueReusableCell(withIdentifier: URLCell.reuseIdentifier) as? URLCell {
                    cell.detailSection = new
                    return cell
                }
            }
        }
         return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return detailNew?.detailListViewModel[section].sectionTitle
    }
}
