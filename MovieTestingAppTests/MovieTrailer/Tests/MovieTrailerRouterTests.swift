//
//  MovieTrailerRouterTests.swift
//  MovieTestingAppTests
//
//  Created by Escurra Colquis on 16/06/23.
//

@testable import MovieTestingApp
import XCTest

class MovieTrailerRouterTests: XCTestCase {
    // MARK: Subject under test
    var sut: MovieTrailerRouterProtocol!
    
    // MARK: Test lifecycle
    override  func setUp() {
        super.setUp()
        setupMovieTrailerRouter()
    }
    
    override  func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    // MARK: Test setup
    func setupMovieTrailerRouter() {
        sut = MovieTrailerRouter()
    }
    
    // MARK: - Tests
    func testRouteToBack() {
        // Given
        let viewMovie: MovieTrailerViewController? = nil
        guard let view = viewMovie else { return }
        // When
        sut.routeToBack(viewMovie: view)
        // Then
        XCTAssertNoThrow(sut.routeToBack(viewMovie: view), "routeToBack executed")
    }
}
