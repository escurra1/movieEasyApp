//
//  LoginViewControllerProtocolSpy.swift
//  MovieTestingAppTests
//
//  Created by Escurra Colquis on 16/06/23.
//

@testable import MovieTestingApp

class LoginViewControllerProtocolSpy: LoginViewControllerProtocol {
    // MARK: - Properties
    var didClearTextField = false
    var didShowToast = false
    var didShowModal = false
    var message: String = .empty
    var title: String = .empty
    
    
    // MARK: - Functions
    func clearTextField() {
        self.didClearTextField = true
    }
    
    func showToast(message: String) {
        self.didShowToast = true
        self.message = message
    }
    
    func showModal(title: String, message: String) {
        self.didShowModal = true
        self.title = title
        self.message = message
    }
}
