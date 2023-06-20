//
//  LoginConfigurator.swift
//  MovieTestingApp
//
//  Created by Escurra Colquis on 16/06/23.
//

protocol LoginConfiguratorProtocol: AnyObject {
    func configureLoginView(viewController: LoginViewController)
}

class LoginConfigurator: LoginConfiguratorProtocol {
    func configureLoginView(viewController: LoginViewController) {
        let router = LoginRouter(with: viewController)
        let viewModel = LoginViewModel(with: viewController, andRouter: router)
        viewController.viewModel = viewModel
    }
}
