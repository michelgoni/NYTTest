//
//  MostViewedListDefaultBuilder.swift
//  NYT
//
//  Created by Michel Goni on 12/02/2018.
//  Copyright (c) 2018, Personal. All rights reserved.
//

import UIKit

final class MostViewedListDefaultBuilder: MostViewedListBuilder {
    var router: MostViewedListRouter?
    var interactorManager: MostViewedListInteractorManager?
    var presenter: MostViewedListPresenter?
    var view: MostViewedListView?

    // MARK: - MostViewedListBuilder protocol
    func buildMostViewedListModule() -> UIViewController? {
        self.buildView()
        self.buildRouter()
        self.buildInteractor()
        self.buildPresenter()
        self.buildCircularDependencies()
        return self.view as? UIViewController
    }

    // MARK: - Private
    fileprivate func buildView() {
        self.view = MostViewedListViewController()
    }

    fileprivate func buildRouter() {
        guard let view = self.view as? UIViewController else {
            assert(false, "View has to be a UIViewController")
            return
        }
        self.router = MostViewedListDefaultRouter(viewController: view)
    }

    fileprivate func buildInteractor() {
        self.interactorManager = MostViewedListDefaultInteractorManager()
    }

    fileprivate func buildPresenter() {
        guard let interactorManager = self.interactorManager, let router = self.router, let view = self.view else {
            assert(false, "No dependencies available")
            return
        }
        self.presenter = MostViewedListDefaultPresenter(interactorManager: interactorManager, router: router, view: view)
    }

    fileprivate func buildCircularDependencies() {
        guard let presenter = self.presenter, let view = self.view as? MostViewedListViewController else {
            assert(false, "No dependencies available")
            return
        }
        view.presenter = presenter
    }
}
