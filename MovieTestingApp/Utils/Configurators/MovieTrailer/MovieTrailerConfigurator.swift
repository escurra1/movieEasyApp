//
//  MovieTrailerConfigurator.swift
//  MovieTestingApp
//
//  Created by Escurra Colquis on 16/06/23.
//

protocol MovieTrailerConfiguratorProtocol: AnyObject {
    func configureMovieTrailerView(viewController: MovieTrailerViewController)
}

class MovieTrailerConfigurator: MovieTrailerConfiguratorProtocol {
    func configureMovieTrailerView(viewController: MovieTrailerViewController) {
        let router = MovieTrailerRouter()
        let viewModel = MovieTrailerViewModel(andRouter: router)
        viewModel.router = router
        viewController.viewModel = viewModel
    }
}
