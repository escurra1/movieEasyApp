//
//  MovieTrailerViewControllerTests.swift
//  MovieTestingAppTests
//
//  Created by Escurra Colquis on 16/06/23.
//

@testable import MovieTestingApp
import XCTest
import YouTubePlayer

class MovieTrailerViewControllerTests: XCTestCase {
    // MARK: Subject under test
    var sut: MovieTrailerViewController!
    var spyViewModel: MovieTrailerViewModelProtocolSpy!
    
    // MARK: Test lifecycle
    override  func setUp() {
        super.setUp()
        setupMovieTrailerViewController()
    }
    
    override  func tearDown() {
        spyViewModel = nil
        sut = nil
        super.tearDown()
    }
    
    // MARK: Test setup
    func setupMovieTrailerViewController() {
        sut = MovieTrailerViewController()
        spyViewModel = MovieTrailerViewModelProtocolSpy()
        sut.trailerPlayerView = YouTubePlayerView()
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
    
    func testDidTapBack() {
        // Given
        let buttonAction = UIButton()
        // When
        sut.didTapBack(buttonAction)
        // Then
        XCTAssertTrue(spyViewModel.didGoToBack)
        XCTAssertNoThrow(sut.didTapBack(buttonAction), "didTapBack executed")
    }
    
    func testPlayerReady() {
        // Given
        let videoPlayer: YouTubePlayerView = YouTubePlayerView()
        // When
        sut.playerReady(videoPlayer)
        // Then
        XCTAssertNoThrow(sut.playerReady(videoPlayer), "playerReady executed")
    }
    
    func testPlayerStateChanged() {
        // Given
        let playerChanged: String = "PlayerChanged"
        // When
        var videoPlayer: YouTubePlayerView = YouTubePlayerView()
        let playerState: YouTubePlayerState? = YouTubePlayerState(rawValue: playerChanged)
        guard let player = playerState else { return }
        sut.playerStateChanged(videoPlayer, playerState: player)
        // Then
        XCTAssertNoThrow(sut.playerStateChanged(videoPlayer, playerState: player), "playerStateChanged executed")
        XCTAssertTrue(spyViewModel.didGoToBack, "didGoToBack executed")
    }
}
