//
//  ListMovieUseCase.swift
//  MovieTestingApp
//
//  Created by Escurra Colquis on 16/06/23.
//

import Foundation

protocol ListMovieInteractorProtocol {
    var viewModel: ListMovieViewModelProtocol? { get set }
    func getListMovie(with url: String, parameters: [String: Any]?, completion: @escaping (_ result: ResponseResult) -> ())
}

class ListMovieUseCase: ListMovieInteractorProtocol {
    weak var viewModel: ListMovieViewModelProtocol?
    var repository: ListMovieRepository?

    init(repository: ListMovieRepository?) {
        self.repository = repository
    }
    
    func getListMovie(with url: String, parameters: [String: Any]?, completion: @escaping (ResponseResult) -> ()) {
        repository?.getListMovie(with: url, parameters: parameters, completion: completion)
    }
}
