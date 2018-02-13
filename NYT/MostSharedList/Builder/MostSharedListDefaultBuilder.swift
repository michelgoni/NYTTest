//
//  MostSharedListDefaultBuilder.swift
//  NYTProject
//
//  Created by Michel Goni on 12/02/2018.
//  Copyright (c) 2018, Michel Goni. All rights reserved.
//

import UIKit

final class MostSharedListDefaultBuilder: MostSharedListBuilder {
    var router: MostSharedListRouter?
    var interactorManager: MostSharedListInteractorManager?
    var presenter: MostSharedListPresenter?
    var view: MostSharedListView?

    // MARK: - MostSharedListBuilder protocol
    func buildMostSharedListModule() -> UIViewController? {
        buildView()
        buildRouter()
        buildInteractor()
        buildPresenter()
        buildCircularDependencies()
        return view as? UIViewController
    }

    // MARK: - Private
    fileprivate func buildView() {
        self.view = MostSharedListViewController()
    }

    fileprivate func buildRouter() {
        guard let view = self.view as? UIViewController else {
            assert(false, "View has to be a UIViewController")
            return
        }
        self.router = MostSharedListDefaultRouter(viewController: view)
    }

    fileprivate func buildInteractor() {
        self.interactorManager = MostSharedListDefaultInteractorManager() 
    }

    fileprivate func buildPresenter() {
        guard let interactorManager = self.interactorManager, let router = self.router, let view = self.view else {
            assert(false, "No dependencies available")
            return
        }
        self.presenter = MostSharedListDefaultPresenter(interactorManager: interactorManager, router: router, view: view)
    }

    fileprivate func buildCircularDependencies() {
        guard let presenter = self.presenter, let view = self.view as? MostSharedListViewController else {
            assert(false, "No dependencies available")
            return
        }
        view.presenter = presenter
    }
}
