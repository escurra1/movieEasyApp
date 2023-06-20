//
//  ListMovieConfigurator.swift
//  MovieTestingApp
//
//  Created by Escurra Colquis on 16/06/23.
//

import Foundation

protocol ListMovieConfiguratorProtocol: AnyObject {
    func configureListMovieView(viewController: ListMovieViewController)
}

class ListMovieConfigurator: ListMovieConfiguratorProtocol {
    func configureListMovieView(viewController: ListMovieViewController) {
        let router = ListMovieRouter(evaluationView: viewController)
        let interactor = ListMovieInteractor()
        let viewModel = ListMovieViewModel(withViewController: viewController, andRouter: router, useCase: interactor)
        viewModel.interactor = interactor
        viewModel.router = router
        viewModel.view = viewController
        viewModel.interactor?.viewModel = viewModel
        viewController.viewModel = viewModel
    }
}
