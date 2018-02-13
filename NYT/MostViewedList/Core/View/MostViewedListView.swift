//
//  MostViewedListView.swift
//  NYT
//
//  Created by Michel Goni on 12/02/2018.
//  Copyright (c) 2018, Personal. All rights reserved.
//

import Foundation

protocol MostViewedListView: class {

    func displayNewsList(withNewsListViewModel newListViewModel: MostViewedListViewModel)
    func displayError(_ errorDescription: String?)
}
