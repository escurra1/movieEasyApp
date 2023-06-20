//
//  LoginViewModel.swift
//  MovieTestingApp
//
//  Created by Escurra Colquis on 16/06/23.
//

import Foundation

protocol LoginViewModelProtocol: AnyObject {
    func validateCredentials(name: String?, password: String?) -> Bool
    func goToListMovie(name: String?, password: String?)
}

class LoginViewModel: LoginViewModelProtocol {
    var view: LoginViewControllerProtocol?
    var router: LoginRouterProtocol?
    init(with view: LoginViewControllerProtocol, andRouter router: LoginRouterProtocol) {
        self.view = view
        self.router = router
    }
    
    func validateCredentials(name: String?, password: String?) -> Bool {
        guard let viewRef = view else { return true }
        guard let name = name, let password = password else {
            return false
        }
        if name.isEmpty || password.isEmpty {
            viewRef.showModal(title: NSLocalizedString("alertIncompleteTitle",
                                                       comment: .empty), message: NSLocalizedString("textFieldRequerired",
                                                                                                    comment: "textFieldRequerired"))
            return false
        }
        
        if name != Constants.User.userName || password != Constants.User.passwordName {
            viewRef.showModal(title: NSLocalizedString("warningTitle",
                                                       
                                                       comment: .empty), message: NSLocalizedString("alertDescriptionMessage",
                                                                                                    comment: "alertDescriptionMessage"))
            return false
        }
        return true
    }
    
    func goToListMovie(name: String?, password: String?) {
        if validateCredentials(name: name, password: password) {
            guard Utils.checkInternetConnection() else {
                self.view?.showToast(message: NSLocalizedString("verificatedInternet", comment: .empty))
                return
            }
            view?.clearTextField()
            router?.routeToListMovie()
        }
    }
}
