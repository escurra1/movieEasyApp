//
//  MovieTrailerViewModelTests.swift
//  MovieTestingAppTests
//
//  Created by Escurra Colquis on 16/06/23.
//

@testable import MovieTestingApp
import XCTest

class MovieTrailerViewModelTests: XCTestCase {
    // MARK: Subject under test
    var sut: MovieTrailerViewModel!
    var spyRouter: MovieTrailerRouterProtocolSpy!
    
    // MARK: Test lifecycle
    override  func setUp() {
        super.setUp()
        setupMovieTrailerPresenter()
    }
    
    override  func tearDown() {
        spyRouter = nil
        sut = nil
        super.tearDown()
    }
    
    // MARK: Test setup
    func setupMovieTrailerPresenter() {
        spyRouter = MovieTrailerRouterProtocolSpy()
        sut = MovieTrailerViewModel(andRouter: spyRouter)
        sut.router = spyRouter
    }
    
    // MARK: - Tests
    func testGoToBack() {
        // Given
        let viewMovie: MovieTrailerViewController? = nil
        guard let view = viewMovie else { return }
        // When
        sut.goToBack(viewMovie: view)
        // Then
        XCTAssertNoThrow(sut.goToBack(viewMovie: view), "goToBack executed")
        XCTAssertTrue(spyRouter.didRouteToBack, "didRouteToBack executed")
    }
}
