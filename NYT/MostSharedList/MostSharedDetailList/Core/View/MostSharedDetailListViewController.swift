//
//  MostSharedDetailListViewController.swift
//  NYTProject
//
//  Created by Michel Goni on 12/02/2018.
//  Copyright (c) 2018, Michel Goni. All rights reserved.
//

import UIKit

class MostSharedDetailListViewController: UIViewController {
    var presenter: MostSharedDetailListPresenter?
    var dataSource : DetailDataSource = DetailDataSource()
    private var newListModel: NewDetailViewModelItem!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.loadNewDetail()
       
        guard let detailSection = newListModel as? MostSharedDetailNew else { return  }
        self.title = detailSection.title
        
        setUpTableView()
    }
    
    func setUpTableView() {
       
        tableView.register(TitleCell.self)
        tableView.register(AbstractCell.self)
        tableView.register(URLCell.self)
        tableView.register(SectionCell.self)
        tableView.dataSource = dataSource
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
    }
}

// MARK: - MostSharedDetailListView
extension MostSharedDetailListViewController: MostSharedDetailListView {

    func displayMostSharedDetailList(withNewListModel newListMode: MostSharedDetailListViewModel) {
        dataSource.setDetailNew(detailNew: newListMode)
        newListModel =  newListMode.detailListViewModel.first
    }
}
