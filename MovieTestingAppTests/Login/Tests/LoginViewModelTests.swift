//
//  LoginViewModelTests.swift
//  MovieTestingAppTests
//
//  Created by Escurra Colquis on 16/06/23.
//

@testable import MovieTestingApp
import XCTest

class LoginViewModelTests: XCTestCase {
    // MARK: Subject under test
    var sut: LoginViewModel!
    var spyView: LoginViewControllerProtocolSpy!
    var spyRouter: LoginRouterProtocolSpy!
    
    // MARK: Test lifecycle
    override  func setUp() {
        super.setUp()
        setupLoginViewModel()
    }
    
    override  func tearDown() {
        spyView = nil
        spyRouter = nil
        sut = nil
        super.tearDown()
    }
    
    // MARK: Test setup
    func setupLoginViewModel() {
        spyView = LoginViewControllerProtocolSpy()
        spyRouter = LoginRouterProtocolSpy()
        sut = LoginViewModel(with: spyView, andRouter: spyRouter)
        sut.router = spyRouter
        sut.view = spyView
    }
    
    // MARK: - Tests
    func testValidateCredentials() {
        // Given
        let name: String = "Admin"
        let password: String = "Password*123."
        // When
        let validate: Bool = sut.validateCredentials(name: name, password: password)
        // Then
        XCTAssertNoThrow(validate, "validateCredentials executed")
        XCTAssertFalse(spyView.didShowModal, "didShowModal executed")
    }
    
    func testGoToListMovie() {
        // Given
        let name: String = "Admin"
        let password: String = "Password*123."
        // When
        sut.goToListMovie(name: name, password: password)
        // Then
        XCTAssertNoThrow(sut.goToListMovie(name: name, password: password), "goToListMovie executed")
        XCTAssertFalse(spyView.didShowToast, "didReloadData executed")
        XCTAssertNoThrow(spyView.didClearTextField, "didShowProgressView executed")
        XCTAssertNoThrow(spyRouter.didRouteToListMovie, "didRouteToListMovie executed")
    }
}
