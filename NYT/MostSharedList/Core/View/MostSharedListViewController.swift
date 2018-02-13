//
//  MostSharedListViewController.swift
//  NYTProject
//
//  Created by Michel Goni on 12/02/2018.
//  Copyright (c) 2018, Michel Goni. All rights reserved.
//

import UIKit

final class MostSharedListViewController: UIViewController {
    var presenter: MostSharedListPresenter?
    var dataSource: NewsDataSource = NewsDataSource()
   
    @IBOutlet weak var tableView: UITableView!
    private let client = NewsApiClient()
    @IBOutlet weak var daysSegmentedController: UISegmentedControl!
    @IBOutlet weak var sourceSegmentedController: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.loadNews()
        setUptableView()
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationItem.title = Constants.NavigationController.emptySharedTitle
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         self.navigationItem.title = Constants.NavigationController.mostSharedTitle
    }
    
    private func setUptableView() {
        
        tableView.register(MostSharedListTableViewCell.self)
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
        tableView.estimatedRowHeight = Constants.Sizes.estimatedRowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
        dataSource.delegate = self
    }
}

// MARK: - MostSharedListView
extension MostSharedListViewController: MostSharedListView {
   
        func displayNewsList(withNewsListViewModel newListViewModel: MostSharedListViewModel) {
            
         dataSource.setNews(withNew: newListViewModel)
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    
    }
    func displayError(_ errorDescription: String?) {
        //MARK:--Time to show some error on an alertView, popUp, whatever it´s required switching on the error description
    }
}

//MARK: - NewidProtocol
extension MostSharedListViewController: NewidProtocol {
    func sendId(newId: Int) {
        presenter?.presentNewsDetail(withNewId: newId)
    }
}