//
//  MovieTrailerViewModelProtocolSpy.swift
//  MovieTestingAppTests
//
//  Created by Escurra Colquis on 16/06/23.
//

@testable import MovieTestingApp

class MovieTrailerViewModelProtocolSpy: MovieTrailerViewModelProtocol {
    // MARK: - Properties
    var didGoToBack = false
    var viewMovie: MovieTrailerViewController? = nil
    
    // MARK: - Functions
    func goToBack(viewMovie: MovieTrailerViewController) {
        self.didGoToBack = true
        self.viewMovie = viewMovie
    }
}
