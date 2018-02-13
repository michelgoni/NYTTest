//
//  MostSharedDetailListDefaultPresenter.swift
//  NYTProject
//
//  Created by Michel Goni on 12/02/2018.
//  Copyright (c) 2018, Michel Goni. All rights reserved.
//

import Foundation

//MARK:-- View model

struct MostSharedDetailListViewModel {
    
    let detailListViewModel: [NewDetailViewModelItem]
}
struct MostSharedDetailNew {
    var title: String?
    var picture: String?
    
}
struct MostSharedDetailSection {
    var section: String?
}
struct MostSharedDetailAbstract {
    var abstract: String?
}
struct MostSharedDetailUrl {
    var url: String?
}

extension MostSharedDetailNew: NewDetailViewModelItem {
    var type: NewDetailViewModelType {
        return .titleAndPicture
    }
    var sectionTitle: String {
        return Constants.DetailListCells.cellTitle
    }
}

extension MostSharedDetailSection: NewDetailViewModelItem {
    var type: NewDetailViewModelType{
        return .section
    }
    var sectionTitle: String{
        return Constants.DetailListCells.cellSection
    }
}

extension MostSharedDetailAbstract:  NewDetailViewModelItem {
    var type: NewDetailViewModelType {
        return .abstract
    }
    var sectionTitle: String {
        return Constants.DetailListCells.cellAbstract
    }
}

extension MostSharedDetailUrl: NewDetailViewModelItem {
    var type: NewDetailViewModelType {
        return .url
    }
    var sectionTitle: String {
        return Constants.DetailListCells.cellUrl
    }
}

// MARK: - Main Class
final class MostSharedDetailListDefaultPresenter {
    
    fileprivate let interactorManager: MostSharedDetailListInteractorManager
    fileprivate let router: MostSharedDetailListRouter
    fileprivate weak var view: MostSharedDetailListView?

    fileprivate let viewModelBuilder = MostSharedDetailListViewModelBuilder()

    init(interactorManager: MostSharedDetailListInteractorManager, router: MostSharedDetailListRouter, view: MostSharedDetailListView) {
        self.interactorManager = interactorManager
        self.router = router
        self.view = view
    }
}


extension MostSharedDetailListDefaultPresenter: MostSharedDetailListPresenter {
    func loadNewDetail() {
        interactorManager.getNewDetail { [unowned self] newDetail in
            
            if let newDetail = newDetail {
                self.buildAndDisplayModel(newsViewModel: newDetail)
            }
        }
    }
    func buildAndDisplayModel(newsViewModel: NewsManaged) {
        
        let detailViewModel = viewModelBuilder.buildViewModel(withNewDetail: newsViewModel)
       
        view?.displayMostSharedDetailList(withNewListModel: detailViewModel!)
    }
}

// MARK: - Model Builder
class MostSharedDetailListViewModelBuilder {
    func buildViewModel(withNewDetail newdetail: NewsManaged) -> MostSharedDetailListViewModel? {
        
        let newDetailViewModel : [NewDetailViewModelItem] = [MostSharedDetailNew(title: newdetail.title!, picture: newdetail.media?.first?.mediametada?.first?.url!),
                                   MostSharedDetailAbstract(abstract: newdetail.abstract),
                                   MostSharedDetailSection(section: newdetail.section),
                                   MostSharedDetailUrl(url: newdetail.url)]
       
        return MostSharedDetailListViewModel(detailListViewModel: newDetailViewModel)
    }
}
