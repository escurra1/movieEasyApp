//
//  DetailMovieRouterProtocolSpy.swift
//  MovieTestingAppTests
//
//  Created by Escurra Colquis on 16/06/23.
//

@testable import MovieTestingApp
import SwiftyJSON

class DetailMovieRouterProtocolSpy: DetailMovieRouterProtocol {
    // MARK: - Properties
    var didRouteToMovieTrailer = false
    var didRouteToBack = false
    var currentViewController: DetailMovieViewController? = nil
    var viewDetail: DetailMovieViewController? = nil
    var trailer: TrailerResponse = TrailerResponse(fromJson: JSON(rawValue: JSON.self) ?? JSON())
    
    // MARK: - Functions
    func routeToMovieTrailer(trailer: TrailerResponse, viewDetail: DetailMovieViewController) {
        self.didRouteToMovieTrailer = true
        self.trailer = trailer
        self.viewDetail = viewDetail
    }
    
    func routeToBack() {
        self.didRouteToBack = true
    }
}
