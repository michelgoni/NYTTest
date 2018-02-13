//
//  MostSharedListView.swift
//  NYTProject
//
//  Created by Michel Goni on 12/02/2018.
//  Copyright (c) 2018, Michel Goni. All rights reserved.
//

import Foundation

protocol MostSharedListView: class {
    
    func displayNewsList(withNewsListViewModel newListViewModel: MostSharedListViewModel)
    func displayError(_ errorDescription: String?)

}
