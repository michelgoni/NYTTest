//
//  MostSharedListDefaultPresenter.swift
//  NYTProject
//
//  Created by Michel Goni on 12/02/2018.
//  Copyright (c) 2018, Michel Goni. All rights reserved.
//
import Foundation

//MARK:--View modeñ
struct MostSharedListViewModel {
    
    let mostSharedListViewModel: [MostSharedList]
}

struct MostSharedList {
    
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
final class MostSharedListDefaultPresenter {
    fileprivate let interactorManager: MostSharedListInteractorManager
    fileprivate let router: MostSharedListRouter
    fileprivate weak var view: MostSharedListView?
    fileprivate let viewModelBuilder = MostSharedListViewModelBuilder()

    init(interactorManager: MostSharedListInteractorManager, router: MostSharedListRouter, view: MostSharedListView) {
        self.interactorManager = interactorManager
        self.router = router
        self.view = view
    }
}

extension MostSharedListDefaultPresenter: MostSharedListPresenter{
    
    func presentNewsDetail(withNewId newId: Int) {
        router.navigateToNewDetail(withNewid: newId)
    }

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
}

// MARK: - Model Builder
final class MostSharedListViewModelBuilder {
    func buildViewModel(withNews newsManaged: [NewsManaged]) -> MostSharedListViewModel {
        
        let flattedList = newsManaged.flatMap { (new) -> MostSharedList? in
            return MostSharedList(image: new.media?.first?.mediametada?.first?.url, title: new.title!, section: new.section!, newId: Int(new.newId))
        }.sorted { $0.title! < $1.title! }

        return MostSharedListViewModel(mostSharedListViewModel: flattedList )
    }
}
