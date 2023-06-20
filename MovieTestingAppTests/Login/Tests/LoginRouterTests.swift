//
//  LoginRouterTests.swift
//  MovieTestingAppTests
//
//  Created by Escurra Colquis on 16/06/23.
//

@testable import MovieTestingApp
import XCTest

class LoginRouterTests: XCTestCase {
    // MARK: Subject under test
    var sut: LoginRouterProtocol!
    var currentViewController: LoginViewController!
    
    // MARK: Test lifecycle
    override  func setUp() {
        super.setUp()
        setupLoginRouter()
    }
    
    override  func tearDown() {
        sut = nil
        currentViewController = nil
        super.tearDown()
    }
    
    // MARK: Test setup
    func setupLoginRouter() {
        currentViewController = LoginViewController()
        sut = LoginRouter(with: currentViewController)
    }
    
    // MARK: - Tests
    func testRouteToListMovie() {
        // Given
        // When
        sut.routeToListMovie()
        // Then
        XCTAssertNoThrow(sut.currentViewController, "currentViewController executed")
        XCTAssertNoThrow(sut.routeToListMovie(), "routeToListMovie executed")
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
