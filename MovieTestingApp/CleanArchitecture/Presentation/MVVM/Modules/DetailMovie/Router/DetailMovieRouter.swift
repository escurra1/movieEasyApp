//
//  DetailMovieRouter.swift
//  MovieTestingApp
//
//  Created by Escurra Colquis on 16/06/23.
//

import Foundation
import UIKit

protocol DetailMovieRouterProtocol: AnyObject {
    var currentViewController: DetailMovieViewController? { get set }
    func routeToMovieTrailer(trailer: TrailerResponse, viewDetail: DetailMovieViewController)
    func routeToBack()
}

class DetailMovieRouter: DetailMovieRouterProtocol {
    weak var currentViewController: DetailMovieViewController?
    let storyBoardMovie = UIStoryboard(name: Constants.Storyboards.moviesStoryboard, bundle: nil)
    
    init(evaluationView viewController: DetailMovieViewController) {
        self.currentViewController = viewController
    }
    
    func routeToMovieTrailer(trailer: TrailerResponse, viewDetail: DetailMovieViewController) {
        guard let viewController = storyBoardMovie.instantiateViewController(withIdentifier: Constants.ViewControllers.movieTrailerViewController) as? MovieTrailerViewController
        else {
            return
        }
        viewController.trailer = trailer
        viewController.modalPresentationStyle = .fullScreen
        viewController.modalTransitionStyle = .flipHorizontal
        viewDetail.present(viewController, animated: true, completion: nil)
    }
    
    func routeToBack() {
        guard let navigationController = currentViewController?.navigationController
        else {
            return
        }
        navigationController.popViewController(animated: true)
    }
}
