//
//  MostViewedListPresenter.swift
//  NYT
//
//  Created by Michel Goni on 12/02/2018.
//  Copyright (c) 2018, Personal. All rights reserved.
//

import Foundation

protocol MostViewedListPresenter {

    func loadNews()
    func presentNewsDetail(withNewId newId: Int)
}
