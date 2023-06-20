//
//  DetailMovieRouterTests.swift
//  MovieTestingAppTests
//
//  Created by Escurra Colquis on 16/06/23.
//

@testable import MovieTestingApp
import XCTest
import SwiftyJSON

class DetailMovieRouterTests: XCTestCase {
    // MARK: Subject under test
    var sut: DetailMovieRouterProtocol!
    var currentViewController: DetailMovieViewController!
    
    // MARK: Test lifecycle
    override  func setUp() {
        super.setUp()
        setupDetailMovieRouter()
    }
    
    override  func tearDown() {
        sut = nil
        currentViewController = nil
        super.tearDown()
    }
    
    // MARK: Test setup
    func setupDetailMovieRouter() {
        currentViewController = DetailMovieViewController()
        sut = DetailMovieRouter(evaluationView: currentViewController)
    }
    
    // MARK: - Tests
    func testRouteToBack() {
        // Given
        // When
        sut.routeToBack()
        // Then
        XCTAssertNoThrow(sut.currentViewController, "currentViewController executed")
        XCTAssertNoThrow(sut.routeToBack(), "routeToBack executed")
    }
    
    func testRouteToMovieTrailer() {
        // Given
        let viewDetail: DetailMovieViewController? = nil
        let trailer: TrailerResponse = TrailerResponse(fromJson: JSON(rawValue: JSON.self) ?? JSON())
        guard let view = viewDetail else { return }
        // When
        sut.routeToMovieTrailer(trailer: trailer, viewDetail: view)
        // Then
        XCTAssertNoThrow(sut.currentViewController, "currentViewController executed")
        XCTAssertNoThrow(sut.routeToMovieTrailer(trailer: trailer, viewDetail: view), "routeToMovieTrailer executed")
    }
}
