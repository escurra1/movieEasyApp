//
//  DetailMovieViewProtocolSpy.swift
//  MovieTestingAppTests
//
//  Created by Escurra Colquis on 16/06/23.
//

@testable import MovieTestingApp
import SwiftyJSON

class DetailMovieViewProtocolSpy: DetailMovieViewProtocol {
    // MARK: - Properties
    var didShowProgressView = false
    var didHideProgressView = false
    var didReloadData = false
    var response: DetailMovieResponse = DetailMovieResponse(fromJson: JSON(rawValue: JSON.self) ?? JSON())
    
    func showProgressView() {
        self.didShowProgressView = true
    }
    
    func hideProgressView() {
        self.didHideProgressView = true
    }
    
    func reloadData(response: DetailMovieResponse) {
        self.didReloadData = true
        self.response = response
    }
}
