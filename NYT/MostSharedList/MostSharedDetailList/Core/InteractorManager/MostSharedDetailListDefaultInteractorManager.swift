//
//  MostSharedDetailListDefaultInteractorManager.swift
//  NYTProject
//
//  Created by Michel Goni on 12/02/2018.
//  Copyright (c) 2018, Michel Goni. All rights reserved.
//

import Foundation

final class MostSharedDetailListDefaultInteractorManager: MostSharedDetailListInteractorManager {
    
    let newId: Int
    let dataProvider = LocalCoreDataService()
    
    init(newId: Int) {
        self.newId = newId
    }
    
    func getNewDetail(completion: @escaping MostSharedDetailListInteractorManager.detailCopletion) {
        
        completion(dataProvider.getSelectedNewForDetailViewController(newId: Int64(newId)))
        
    }

}
