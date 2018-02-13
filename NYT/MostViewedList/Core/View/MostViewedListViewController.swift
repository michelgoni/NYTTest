//
//  MostViewedListViewController.swift
//  NYT
//
//  Created by Michel Goni on 12/02/2018.
//  Copyright (c) 2018, Personal. All rights reserved.
//

import UIKit

final class MostViewedListViewController: UIViewController {
    var presenter: MostViewedListPresenter?

    @IBOutlet weak var tableView: UITableView!
    var dataSource: MostViewedDataSource = MostViewedDataSource()
    private let client = NewsApiClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.loadNews()
        setUptableView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.navigationItem.title = Constants.NavigationController.emptyMostViewedTitle
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = Constants.NavigationController.mostViewedTitle
    }
    
    private func setUptableView() {
        
        tableView.register(MostViewedListTableViewCell.self)
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
        tableView.estimatedRowHeight = Constants.Sizes.estimatedRowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
    }
}

// MARK: - MostViewedListView
extension MostViewedListViewController: MostViewedListView {
    func displayNewsList(withNewsListViewModel newListViewModel: MostViewedListViewModel) {
        
        dataSource.setNews(withNew: newListViewModel)
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    //MARK:--Same as previous section: time to display some short of error using the APIError description
    func displayError(_ errorDescription: String?) {

    }
}

extension MostViewedListViewController: NewidProtocol {
    func sendId(newId: Int) {
        
        //MARK:--Inject the newId presenter-->router-->newContainer and instantiate our interactor manager with the newId
    }
}
