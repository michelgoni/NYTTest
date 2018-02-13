//
//  MostSharedDetailListDefaultBuilder.swift
//  NYTProject
//
//  Created by Michel Goni on 12/02/2018.
//  Copyright (c) 2018, Michel Goni. All rights reserved.
//

import UIKit

final class MostSharedDetailListDefaultBuilder: MostSharedDetailListBuilder {
    var router: MostSharedDetailListRouter?
    var interactorManager: MostSharedDetailListInteractorManager?
    var presenter: MostSharedDetailListPresenter?
    var view: MostSharedDetailListView?

    // MARK: - MostSharedDetailListBuilder protocol
    func buildMostSharedDetailListModule(withNewId newId: Int) -> UIViewController? {
        buildView()
        buildRouter()
        buildInteractor(withNewId: newId)
        buildPresenter()
        buildCircularDependencies()
        return view as? UIViewController
    }

    // MARK: - Private
    fileprivate func buildView() {
        self.view = MostSharedDetailListViewController()
    }

    fileprivate func buildRouter() {
        guard let view = self.view as? UIViewController else {
            assert(false, "View has to be a UiviewController")
            return
        }
        self.router = MostSharedDetailListDefaultRouter(viewController: view)
    }

    fileprivate func buildInteractor(withNewId newId: Int) {
        self.interactorManager = MostSharedDetailListDefaultInteractorManager(newId: newId) // TODO: set dependencies in init (use case/s, services...)
    }

    fileprivate func buildPresenter() {
        guard let interactorManager = self.interactorManager, let router = self.router, let view = self.view else {
            assert(false, "No dependencies available")
            return
        }
        self.presenter = MostSharedDetailListDefaultPresenter(interactorManager: interactorManager, router: router, view: view)
    }

    fileprivate func buildCircularDependencies() {
        guard let presenter = self.presenter, let view = self.view as? MostSharedDetailListViewController else {
            assert(false, "No dependencies available")
            return
        }
        view.presenter = presenter
    }
}
