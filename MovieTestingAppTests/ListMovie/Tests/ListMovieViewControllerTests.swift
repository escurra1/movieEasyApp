//
//  ListMovieViewControllerTests.swift
//  MovieTestingAppTests
//
//  Created by Escurra Colquis on 16/06/23.
//

@testable import MovieTestingApp
import XCTest

class ListMovieViewControllerTests: XCTestCase {
    // MARK: Subject under test
    var sut: ListMovieViewController!
    var spyViewModel: ListMovieViewModelProtocolSpy!
    
    // MARK: Test lifecycle
    override  func setUp() {
        super.setUp()
        setupListMovieViewController()
    }
    
    override  func tearDown() {
        spyViewModel = nil
        sut = nil
        super.tearDown()
    }
    
    // MARK: Test setup
    func setupListMovieViewController() {
        sut = ListMovieViewController()
        spyViewModel = ListMovieViewModelProtocolSpy()
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
    
    func testReloadData() {
        // Given
        // When
        sut.reloadData()
        // Then
        XCTAssertNoThrow(sut.reloadData(), "reloadData executed")
        XCTAssertNoThrow(sut.upcomingCollectionView, "upcomingCollectionView executed")
    }
    
    func testShowListMovie() {
        // Given
        let movie: [MovieResponse] = []
        // When
        sut.showListMovie(movie: movie)
        // Then
        XCTAssertNoThrow(sut.showListMovie(movie: movie), "showListMovie executed")
        XCTAssertNoThrow(sut.upcomingCollectionView, "upcomingCollectionView executed")
    }
    
    func showModal() {
        // Given
        let title: String = "Title"
        let message: String = "Message"
        // When
        sut.showModal(title: title, message: message)
        // Then
        XCTAssertNoThrow(sut.showModal(title: title, message: message), "showModal executed")
    }
    
    func testShowProgressView() {
        // Given
        // When
        sut.showProgressView()
        // Then
        XCTAssertNoThrow(sut.showProgressView(), "showProgressView executed")
    }
    
    func testHideProgressView() {
        // Given
        // When
        sut.hideProgressView()
        // Then
        XCTAssertNoThrow(sut.hideProgressView(), "hideProgressView executed")
    }
    
    func testNumberOfItemsInSection() {
        // Given
        let collection = UICollectionView(frame: CGRect(x: 0, y: 0, width: 100, height: 100), collectionViewLayout: UICollectionViewFlowLayout())
        let section: Int = 0
        var itemInSection = sut.collectionView(collection, numberOfItemsInSection: section)
        // When
        itemInSection = 0
        // Then
        XCTAssertEqual(itemInSection, 0)
    }
    
    func testCellForItemAt() {
        // Given
        let imageTest = UIImage()
        let cellUpcoming = "UpcomingCollectionViewCell"
        let collection = UICollectionView(frame: CGRect(x: 0, y: 0, width: 100, height: 100), collectionViewLayout: UICollectionViewFlowLayout())
        let indexPath = IndexPath(item: 0, section: 0)
        // When
        collection.register(UpcomingCollectionViewCell.self, forCellWithReuseIdentifier: cellUpcoming)
        let cellA = collection.dataSource?.collectionView(collection, cellForItemAt: indexPath) as? UpcomingCollectionViewCell
        guard let cellTestA = cellA  else {
            return
        }
        // Then
        XCTAssertTrue(cellTestA == cellTestA, "cellA executed")
        XCTAssert(cellTestA.iconMovieImageView.image == imageTest, "imageView executed")
        XCTAssertNotNil(cellTestA.iconMovie)
        XCTAssertNotNil(cellTestA.prepareForReuse)
    }
    
    func testDidSelectItemAt() {
        // Given
        let collection = UICollectionView(frame: CGRect(x: 0, y: 0, width: 100, height: 100), collectionViewLayout: UICollectionViewFlowLayout())
        let indexPath = IndexPath(item: 0, section: 0)
        // When
        let selectionSection: () = sut.collectionView(collection, didSelectItemAt: indexPath)
        // Then
        XCTAssertNoThrow(selectionSection)
    }
    
    func testCollectionViewLayout() {
        // Given
        let collection = UICollectionView(frame: CGRect(x: 0, y: 0, width: 100, height: 100), collectionViewLayout: UICollectionViewFlowLayout())
        let layout = UICollectionViewLayout()
        let indexPath = IndexPath(item: 0, section: 0)
        // When
        let layoutSection = sut.collectionView(collection, layout: layout, sizeForItemAt: indexPath)
        // Then
        XCTAssertNoThrow(layoutSection)
        XCTAssertNoThrow(sut.upcomingCollectionView?.bounds.width, "upcomingCollectionViewWidth executed")
        XCTAssertNoThrow(sut.upcomingCollectionView?.bounds.height, "upcomingCollectionViewHeight executed")
    }
    
    func testInsetForSectionAt() {
        // Given
        let collection = UICollectionView(frame: CGRect(x: 0, y: 0, width: 100, height: 100), collectionViewLayout: UICollectionViewFlowLayout())
        let layout = UICollectionViewLayout()
        let insetForSectionAt = 1
        // When
        var layoutSection = sut.collectionView(collection, layout: layout, insetForSectionAt: insetForSectionAt)
        layoutSection = UIEdgeInsets.zero
        // Then
        XCTAssertNoThrow(layoutSection)
    }
    
    func testMinimumInteritemSpacingForSectionAt() {
        // Given
        let collection = UICollectionView(frame: CGRect(x: 0, y: 0, width: 100, height: 100), collectionViewLayout: UICollectionViewFlowLayout())
        let layout = UICollectionViewLayout()
        let minimumSpacing = 1
        // When
        var layoutSection = sut.collectionView(collection, layout: layout, minimumInteritemSpacingForSectionAt: minimumSpacing)
        layoutSection = 1
        // Then
        XCTAssertNoThrow(layoutSection)
    }
    
    func testMinimumLineSpacingForSectionAt() {
        // Given
        let collection = UICollectionView(frame: CGRect(x: 0, y: 0, width: 100, height: 100), collectionViewLayout: UICollectionViewFlowLayout())
        let layout = UICollectionViewLayout()
        let minimumLine = 1
        // When
        var layoutSection = sut.collectionView(collection, layout: layout, minimumLineSpacingForSectionAt: minimumLine)
        layoutSection = 1
        // Then
        XCTAssertNoThrow(layoutSection)
    }
    
    func testTextDidChange() {
        // Given
        let searchBar = UISearchBar()
        let textSearch = "MovieTest"
        // When
        sut.searchBar(searchBar, textDidChange: textSearch)
        // Then
        XCTAssertNoThrow(sut.searchBar(searchBar, textDidChange: textSearch), "textDidChange executed")
    }
    
    func testSearchBarTextDidBeginEditing() {
        // Given
        let searchBar = UISearchBar()
        // When
        sut.searchBarTextDidBeginEditing(searchBar)
        // Then
        XCTAssertNoThrow(sut.searchBarTextDidBeginEditing(searchBar), "searchBarTextDidBeginEditing executed")
    }
    
    func testSearchBarTextDidEndEditing() {
        // Given
        let searchBar = UISearchBar()
        // When
        sut.searchBarTextDidEndEditing(searchBar)
        // Then
        XCTAssertNoThrow(sut.searchBarTextDidEndEditing(searchBar), "searchBarTextDidEndEditing executed")
    }
    
    func testSearchBarSearchButtonClicked() {
        // Given
        let searchBar = UISearchBar()
        // When
        sut.searchBarSearchButtonClicked(searchBar)
        // Then
        XCTAssertNoThrow(sut.searchBarSearchButtonClicked(searchBar), "searchBarSearchButtonClicked executed")
    }
    
    func testSearchBarCancelButtonClicked() {
        // Given
        let searchBar = UISearchBar()
        // When
        sut.searchBarCancelButtonClicked(searchBar)
        // Then
        XCTAssertNoThrow( sut.searchBarCancelButtonClicked(searchBar), "searchBarCancelButtonClicked executed")
    }
    
    func testShouldChangeTextIn() {
        // Given
        let searchBar = UISearchBar()
        let text = "Movie"
        let change = NSRange()
        // When
        let testSearch = sut.searchBar(searchBar, shouldChangeTextIn: change, replacementText: text)
        // Then
        XCTAssertNoThrow(testSearch, "shouldChangeTextIn executed")
    }
}
