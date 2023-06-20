//
//  DetailMovieViewModel.swift
//  MovieTestingApp
//
//  Created by Escurra Colquis on 16/06/23.
//

import Foundation

protocol DetailMovieViewModelProtocol: AnyObject {
    func getDetailMovie(movieId: String)
    func showMovieTrailer(movieId: String, viewDetail: DetailMovieViewController)
    func goToMovieTrailer(trailer: TrailerResponse,  viewDetail: DetailMovieViewController)
    func hideProgress()
    func goToBack()
}

class DetailMovieViewModel: DetailMovieViewModelProtocol {
    weak var view: DetailMovieViewProtocol?
    var router: DetailMovieRouterProtocol?
    var interactor: DetailMovieInteractorProtocol?
    
    init(withViewController view: DetailMovieViewProtocol?, andRouter router: DetailMovieRouterProtocol?, useCase interactor: DetailMovieInteractorProtocol?) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
    func getDetailMovie(movieId: String) {
        view?.showProgressView()
        let params: [String:Any] = ["api_key": Constants.Api.apiKey, "movie_id": movieId]
        interactor?.getDetailMovie(with:  Constants.Urls.baseUrl + Constants.Urls.detail, parameters: params, completion:{ [weak self]
            response in
            guard let welf = self else { return }
            switch(response) {
            case .success(let responseJson):
                let response = DetailMovieResponse(fromJson: responseJson)
                DispatchQueue.main.async {
                    welf.view?.reloadData(response: response)
                }
            case .failure(let error):
                print(error)
            }
        })
    }
    
    func showMovieTrailer(movieId: String, viewDetail: DetailMovieViewController) {
        view?.showProgressView()
        let params:[String:Any] = ["api_key": Constants.Api.apiKey,"movie_id": movieId]
        interactor?.getDetailMovie(with: Constants.Urls.baseUrl + Constants.Urls.trailer, parameters: params, completion:{ [weak self]
            response in
            switch(response) {
            case .success(let responseTrailer):
                let movieVideo = MovieVideoResponse(fromJson: responseTrailer)
                if let trailer = movieVideo.trailers?.first {
                    self?.goToMovieTrailer(trailer: trailer, viewDetail: viewDetail)
                }
                else {
                    Utils.showToast(message: NSLocalizedString("trailerNotFound", comment: "trailerNotFound"))
                }
            case .failure(let error):
                print(error)
                Utils.showMessageTop(true, textBody: NSLocalizedString("errorService", comment: "errorService"))
            }
        })
    }
    
    func goToMovieTrailer(trailer: TrailerResponse,  viewDetail: DetailMovieViewController) {
        router?.routeToMovieTrailer(trailer: trailer, viewDetail: viewDetail)
    }
    
    func hideProgress() {
        view?.hideProgressView()
    }
    
    func goToBack() {
        router?.routeToBack()
    }
}
