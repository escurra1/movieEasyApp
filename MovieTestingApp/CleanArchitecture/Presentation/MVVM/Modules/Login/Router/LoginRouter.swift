//
//  LoginRouter.swift
//  MovieTestingApp
//
//  Created by Escurra Colquis on 16/06/23.
//

import Foundation

protocol LoginRouterProtocol: AnyObject {
    var currentViewController: LoginViewController? {get set}
    func routeToBack()
    func routeToListMovie()
}

class LoginRouter: LoginRouterProtocol {
    weak var currentViewController: LoginViewController?
    private let storyBoardMovie = UIStoryboard(name: "Movies", bundle: nil)
    init(with viewController: LoginViewController) {
        self.currentViewController = viewController
    }
    
    func routeToBack() {
        guard let navigationController = currentViewController?.navigationController
            else {
                return
        }
        navigationController.popViewController(animated: true)
    }
    
    func routeToListMovie() {
        guard let navigationController = currentViewController?.navigationController, let viewController = storyBoardMovie.instantiateViewController(withIdentifier: Constants.ViewControllers.listMovieViewController) as? ListMovieViewController
            else {
                return
        }
        navigationController.pushViewController(viewController, animated: true)
    }
}
