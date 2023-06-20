//
//  MovieTrailerRouter.swift
//  MovieTestingApp
//
//  Created by Escurra Colquis on 16/06/23.
//

import Foundation

protocol MovieTrailerRouterProtocol: AnyObject {
    func routeToBack(viewMovie: MovieTrailerViewController)
}

class MovieTrailerRouter: MovieTrailerRouterProtocol {
    func routeToBack(viewMovie: MovieTrailerViewController) {
        viewMovie.dismiss(animated: true)
    }
}
