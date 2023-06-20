//
//  ListMovieRouter.swift
//  MovieTestingApp
//
//  Created by Escurra Colquis on 16/06/23.
//

import Foundation
import UIKit

protocol ListMovieRouterProtocol: AnyObject {
    var currentViewController: ListMovieViewController? { get set }
    func routeToDetailMovie()
    func routeToBack()
}

class ListMovieRouter: ListMovieRouterProtocol {
    weak var currentViewController: ListMovieViewController?
    let storyBoardMovie = UIStoryboard(name: Constants.Storyboards.moviesStoryboard, bundle: nil)
    
    init(evaluationView viewController: ListMovieViewController) {
        self.currentViewController = viewController
    }
    
    func routeToDetailMovie() {
        guard let navigationController = currentViewController?.navigationController, let viewController = storyBoardMovie.instantiateViewController(withIdentifier: Constants.ViewControllers.detailMovieViewController) as? DetailMovieViewController
        else {
            return
        }
        viewController.movieDetail = currentViewController?.listMovieSelect
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func routeToBack() {
        guard let navigationController = currentViewController?.navigationController
            else {
                return
        }
        navigationController.popViewController(animated: true)
    }
}
