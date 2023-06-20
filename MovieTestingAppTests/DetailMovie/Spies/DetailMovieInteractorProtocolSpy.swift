//
//  DetailMovieInteractorProtocolSpy.swift
//  MovieTestingAppTests
//
//  Created by Escurra Colquis on 16/06/23.
//

@testable import MovieTestingApp
import SwiftyJSON

class DetailMovieInteractorProtocolSpy: DetailMovieInteractorProtocol {
    // MARK: - Properties
    var didGetDetailMovie = false
    var viewModel: DetailMovieViewModelProtocol?
    var url: String? = .empty
    var parameters: [String: Any]? = [String: Any]()
    var responseResult: ()
    var result: ResponseResult = .success(result: JSON(rawValue: JSON.self) ?? JSON())
    
    // MARK: - Functions
    func getDetailMovie(with url: String, parameters: [String: Any]?, completion: @escaping (ResponseResult) -> ()) {
        self.didGetDetailMovie = true
        self.url = url
        self.parameters = parameters
        self.responseResult = completion(result)
        return responseResult
    }
}
