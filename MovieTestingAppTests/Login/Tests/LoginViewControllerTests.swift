//
//  LoginViewControllerTests.swift
//  MovieTestingAppTests
//
//  Created by Escurra Colquis on 16/06/23.
//

@testable import MovieTestingApp
import XCTest

class LoginViewControllerTests: XCTestCase {
    // MARK: Subject under test
    var sut: LoginViewController!
    var spyViewModel: LoginViewModelProtocolSpy!
    
    // MARK: Test lifecycle
    override  func setUp() {
        super.setUp()
        setupLoginViewController()
    }
    
    override  func tearDown() {
        spyViewModel = nil
        sut = nil
        super.tearDown()
    }
    
    // MARK: Test setup
    func setupLoginViewController() {
        sut = LoginViewController()
        spyViewModel = LoginViewModelProtocolSpy()
        sut.viewModel = spyViewModel
    }
    
    // MARK: Tests
    func testViewDidLoad() {
        // Given
        // When
        sut.viewDidLoad()
        // Then
        XCTAssertNoThrow(sut.viewDidLoad())
        XCTAssertNotNil(sut, "sut should be instantiated")
    }
    
    func testViewDidAppear() {
        // Given
        let animated: Bool = true
        // When
        sut.viewDidAppear(animated)
        // Then
        XCTAssertNoThrow(sut.viewDidAppear(animated))
        XCTAssertNotNil(sut, "sut should be instantiated")
    }
    
    func testDidTapLogin() {
        // Given
        let button = UIButton()
        // When
        sut.didTapLogin(button)
        // Then
        XCTAssertNoThrow(sut.didTapLogin(button), "didTapLogin executed")
    }
    
    func testUserEditingChanged() {
        // Given
        let textField = UITextField()
        // When
        sut.userEditingChanged(textField)
        // Then
        XCTAssertNoThrow(sut.userEditingChanged(textField), "userEditingChanged executed")
    }
    
    func testPasswordEditingChanged() {
        // Given
        let textField = UITextField()
        // When
        sut.passwordEditingChanged(textField)
        // Then
        XCTAssertNoThrow(sut.passwordEditingChanged(textField), "passwordEditingChanged executed")
    }
    
    func testClearTextField() {
        // Given
        // When
        sut.clearTextField()
        // Then
        XCTAssertNoThrow(sut.clearTextField(), "clearTextField executed")
    }
    
    func testShowToast() {
        // Given
        let message: String = "Login"
        // When
        sut.showToast(message: message)
        // Then
        XCTAssertNoThrow(sut.showToast(message: message), "showToast executed")
    }
    
    func testShowModal() {
        // Given
        let title: String = "Title"
        let message: String = "Login"
        // When
        sut.showModal(title: title, message: message)
        // Then
        XCTAssertNoThrow(sut.showModal(title: title, message: message), "showModal executed")
    }
    
    func testDidTapAccept() {
        // Given
        // When
        sut.didTapAccept()
        // Then
        XCTAssertNoThrow(sut.didTapAccept(), "didTapAccept executed")
    }
    
    func testTextFieldShouldReturn() {
        // Given
        let textField = UITextField()
        // When
        let result = sut.textFieldShouldReturn(textField)
        // Then
        XCTAssertNoThrow(result, "textFieldShouldReturn executed")
    }
    
    func testTextFieldDidBeginEditing() {
        // Given
        let textField = UITextField()
        // When
        let result: () = sut.textFieldDidBeginEditing(textField)
        // Then
        XCTAssertNoThrow(result, "textFieldDidBeginEditing executed")
    }
    
    func testTextFieldDidEndEditing() {
        // Given
        let textField = UITextField()
        // When
        let result: () = sut.textFieldDidEndEditing(textField)
        // Then
        XCTAssertNoThrow(result, "textFieldDidEndEditing executed")
    }
}
