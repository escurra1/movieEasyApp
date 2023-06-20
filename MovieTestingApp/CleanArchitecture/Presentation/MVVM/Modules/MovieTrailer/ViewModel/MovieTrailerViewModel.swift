//
//  MovieTrailerViewModel.swift
//  MovieTestingApp
//
//  Created by Escurra Colquis on 16/06/23.
//

import Foundation

protocol MovieTrailerViewModelProtocol: AnyObject {
    func goToBack(viewMovie: MovieTrailerViewController)
}

class MovieTrailerViewModel: MovieTrailerViewModelProtocol {
    var router: MovieTrailerRouterProtocol?
    
    init(andRouter router: MovieTrailerRouterProtocol?) {
        self.router = router
    }
    
    func goToBack(viewMovie: MovieTrailerViewController) {
        router?.routeToBack(viewMovie: viewMovie)
    }
}
