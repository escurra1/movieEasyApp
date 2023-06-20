//
//  ListMovieRouterProtocolSpy.swift
//  MovieTestingAppTests
//
//  Created by Escurra Colquis on 16/06/23.
//

@testable import MovieTestingApp

class ListMovieRouterProtocolSpy: ListMovieRouterProtocol {
    // MARK: - Properties
    var didRouteToDetailMovie = false
    var didRouteToBack = false
    var currentViewController: ListMovieViewController? = nil
    
    // MARK: - Functions
    func routeToDetailMovie() {
        self.didRouteToDetailMovie = true
    }
    
    func routeToBack() {
        self.didRouteToBack = true
    }
}
