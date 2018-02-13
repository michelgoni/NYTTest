//
//  MostViewedListDefaultPresenter.swift
//  NYT
//
//  Created by Michel Goni on 12/02/2018.
//  Copyright (c) 2018, Personal. All rights reserved.
//

import Foundation

struct MostViewedListViewModel {
    
 let mostViewedListViewModel: [MostViewedList]
}

struct MostViewedList {
    
    let image: String?
    let title: String?
    let section: String?
    let newId: Int?
    
    init(image: String? = nil, title: String, section: String, newId: Int) {
        self.image = image
        self.title = title
        self.section = section
        self.newId = newId
    }
}

// MARK: - Main Class
final class MostViewedListDefaultPresenter {
    fileprivate let interactorManager: MostViewedListInteractorManager
    fileprivate let router: MostViewedListRouter
    fileprivate weak var view: MostViewedListView?

    fileprivate let viewModelBuilder = MostViewedListViewModelBuilder()

    init(interactorManager: MostViewedListInteractorManager, router: MostViewedListRouter, view: MostViewedListView) {
        self.interactorManager = interactorManager
        self.router = router
        self.view = view
    }
}

// MARK: - MostViewedListPresenter
extension MostViewedListDefaultPresenter: MostViewedListPresenter {
    func loadNews() {
        
        interactorManager.getNews { [unowned self] results, error in
            if error == nil {
               self.buildAndDisplayModel(newsViewModel: Array(results!))
            }else{
                self.view?.displayError(error)
            }
        }
    }
    
    private func buildAndDisplayModel(newsViewModel: [NewsManaged]) {
        
        let newsViewModel = self.viewModelBuilder.buildViewModel(withNews: newsViewModel)
        view?.displayNewsList(withNewsListViewModel: newsViewModel)
    }
    
     //TODO:--Time to show same as before, mostViewed detailed item
    func presentNewsDetail(withNewId newId: Int) {
        
    }

}

// MARK: - Model Builder
final class MostViewedListViewModelBuilder {
    func buildViewModel(withNews newsManaged: [NewsManaged]) -> MostViewedListViewModel {
        
        let flattedList = newsManaged.flatMap { new -> MostViewedList? in
            
            return MostViewedList(image: new.media?.first?.mediametada?.first?.url, title: new.title!, section: new.section!, newId: Int(new.newId))
            }.sorted { $0.title! < $1.title! }
        
        return MostViewedListViewModel(mostViewedListViewModel: flattedList )
    }
}
