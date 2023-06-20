//
//  LoginRouterProtocolSpy.swift
//  MovieTestingAppTests
//
//  Created by Escurra Colquis on 16/06/23.
//

@testable import MovieTestingApp

class LoginRouterProtocolSpy: LoginRouterProtocol {
    // MARK: - Properties
    var currentViewController: LoginViewController?
    var didRouteToBack = false
    var didRouteToListMovie = false
    
    // MARK: - Functions
    func routeToBack() {
        self.didRouteToBack = true
    }
    
    func routeToListMovie() {
        self.didRouteToListMovie = true
    } 
}
