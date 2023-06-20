//
//  ListMovieViewModel.swift
//  MovieTestingApp
//
//  Created by Escurra Colquis on 16/06/23.
//

import Foundation

protocol ListMovieViewModelProtocol: AnyObject {
    func getListMovie(type: TypeApi, page: Int)
    func hideProgress()
    func goToDetailMovie()
    func goToBack()
    var arrayUncomingMovie: [MovieResponse]? { get set }
    var page: Int? { get set }
    var totalPage: Int? { get set }
}

class ListMovieViewModel: ListMovieViewModelProtocol {
    weak var view: ListMovieViewProtocol?
    var router: ListMovieRouterProtocol?
    var interactor: ListMovieInteractorProtocol?
    var arrayUncomingMovie: [MovieResponse]? = []
    var listMovie: [MovieResponse]? = []
    var apiUrl: String = .empty
    var page: Int? = 0
    var totalPage: Int? = 0
    
    init(withViewController view: ListMovieViewProtocol?, andRouter router: ListMovieRouterProtocol?, useCase interactor: ListMovieInteractorProtocol?) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
    func hideProgress() {
        view?.hideProgressView()
    }
    
    func goToDetailMovie() {
        router?.routeToDetailMovie()
    }
    
    func goToBack() {
        router?.routeToBack()
    }
    
    func getListMovie(type: TypeApi, page: Int) {
        view?.showProgressView()
        let pageMovie = String(page)
        let params = ["api_key": Constants.Api.apiKey,
                      "page": pageMovie] as [String: Any]
        switch type {
        case .upcoming:
            apiUrl = Constants.Urls.upcomingPage
        }
        interactor?.getListMovie(with:  Constants.Urls.baseUrl + apiUrl, parameters: params, completion:{ [weak self]
            response in
            guard let welf = self else { return }
            switch(response) {
            case .success(let responseJson):
                let response = WelcomeMovieResponse(fromJson: responseJson)
                guard let resultsResponse = response.results else { return }
                switch type {
                case .upcoming:
                    welf.page = response.page ?? 1
                    welf.totalPage = response.totalPages ?? 1
                    welf.arrayUncomingMovie?.append(contentsOf: resultsResponse)
                }
                DispatchQueue.main.async {
                    welf.view?.showListMovie(movie: resultsResponse)
                }
            case .failure(let error):
                print(error)
                welf.view?.showModal(title: NSLocalizedString("errorService",
                                                              comment: .empty), message: NSLocalizedString("errorServiceDescription",
                                                                                                           comment: "errorServiceDescription"))
            }
        })
    }
}
