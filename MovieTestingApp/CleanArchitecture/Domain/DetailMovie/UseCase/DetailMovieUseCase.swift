//
//  DetailMovieUseCase.swift
//  MovieTestingApp
//
//  Created by Escurra Colquis on 16/06/23.
//

import Foundation

protocol DetailMovieInteractorProtocol: AnyObject {
    var viewModel: DetailMovieViewModelProtocol? { get set }
    func getDetailMovie(with url: String, parameters: [String: Any]?, completion: @escaping (_ result: ResponseResult) -> ())
}

class DetailMovieUseCase: DetailMovieInteractorProtocol {
    weak var viewModel: DetailMovieViewModelProtocol?
    var repository: DetailMovieRepository?

    init(repository: DetailMovieRepository?) {
        self.repository = repository
    }
    
    func getDetailMovie(with url: String, parameters: [String : Any]?, completion: @escaping (ResponseResult) -> ()) {
        repository?.getDetailMovie(with: url, parameters: parameters, completion: completion)
    }
}
