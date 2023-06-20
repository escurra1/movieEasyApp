//
//  ListMovieViewProtocolSpy.swift
//  MovieTestingAppTests
//
//  Created by Escurra Colquis on 16/06/23.
//

@testable import MovieTestingApp

class ListMovieViewProtocolSpy: ListMovieViewProtocol {
    // MARK: - Properties
    var didShowProgressView = false
    var didHideProgressView = false
    var didReloadData = false
    var didShowListMovie = false
    var didShowModal = false
    var title: String = .empty
    var message: String = .empty
    
    // MARK: - Functions
    func showProgressView() {
        self.didShowProgressView = true
    }
    
    func hideProgressView() {
        self.didHideProgressView = true
    }
    
    func reloadData() {
        self.didReloadData = true
    }
    
    func showListMovie(movie: [MovieResponse]) {
        self.didShowListMovie = true
    }
    
    func showModal(title: String, message: String) {
        self.didShowModal = true
        self.title = title
        self.message = message
    }
}
