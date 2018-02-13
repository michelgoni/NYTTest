//
//  MostSharedListPresenter.swift
//  NYTProject
//
//  Created by Michel Goni on 12/02/2018.
//  Copyright (c) 2018, Michel Goni. All rights reserved.
//

import Foundation

protocol MostSharedListPresenter {

    func loadNews()
    func loadNewsWithSelectedRange(_ range: NewsFeed)
    func presentNewsDetail(withNewId newId: Int)
    
}
