//
//  DetailMovieConfigurator.swift
//  MovieTestingApp
//
//  Created by Escurra Colquis on 16/06/23.
//

import Foundation

protocol DetailMovieConfiguratorProtocol: AnyObject {
    func configureDetailMovieView(viewController: DetailMovieViewController)
}

class DetailMovieConfigurator: DetailMovieConfiguratorProtocol {
    func configureDetailMovieView(viewController: DetailMovieViewController) {
        let router = DetailMovieRouter(evaluationView: viewController)
        let interactor = DetailMovieInteractor()
        let viewModel = DetailMovieViewModel(withViewController: viewController, andRouter: router, useCase: interactor)
        viewModel.interactor = interactor
        viewModel.router = router
        viewModel.view = viewController
        viewModel.interactor?.viewModel = viewModel
        viewController.viewModel = viewModel
    }
}
