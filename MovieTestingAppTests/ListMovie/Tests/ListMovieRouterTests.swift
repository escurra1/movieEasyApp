//
//  ListMovieRouterTests.swift
//  MovieTestingAppTests
//
//  Created by Escurra Colquis on 16/06/23.
//

@testable import MovieTestingApp
import XCTest

class ListMovieRouterTests: XCTestCase {
    // MARK: Subject under test
    var sut: ListMovieRouterProtocol!
    var currentViewController: ListMovieViewController!
    
    // MARK: Test lifecycle
    override  func setUp() {
        super.setUp()
        setupListMovieRouter()
    }
    
    override  func tearDown() {
        sut = nil
        currentViewController = nil
        super.tearDown()
    }
    
    // MARK: Test setup
    func setupListMovieRouter() {
        currentViewController = ListMovieViewController()
        sut = ListMovieRouter(evaluationView: currentViewController)
    }
    
    // MARK: - Tests
    func testRouteToMovieTrailer() {
        // Given
        // When
        sut.routeToDetailMovie()
        // Then
        XCTAssertNoThrow(sut.currentViewController, "currentViewController executed")
        XCTAssertNoThrow(sut.routeToDetailMovie(), "routeToDetailMovie executed")
    }
    
    func testRouteToBack() {
        // Given
        // When
        sut.routeToBack()
        // Then
        XCTAssertNoThrow(sut.currentViewController, "currentViewController executed")
        XCTAssertNoThrow(sut.routeToBack(), "routeToBack executed")
    }
}
