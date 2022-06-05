//
//  HomeTableViewController.swift
//  PetDirectoryAppTests
//
//  Created by Decagon on 3/31/22.
//

import XCTest
@testable import PetDirectoryApp

class HomeTableViewControllerTests: XCTestCase {
    var storyBoard: UIStoryboard!
    var reuseIdentifier: String!
    var sut: HomeTableViewController!

    override func setUp() {
        super.setUp()

         storyBoard = UIStoryboard(name: "Main", bundle: nil)
         reuseIdentifier = String(describing: HomeTableViewController.self)
         sut = (storyBoard.instantiateViewController(identifier: reuseIdentifier) as! HomeTableViewController)

    }
    override func tearDown() {
        storyBoard = nil
        reuseIdentifier = nil
        sut = nil

        super.tearDown()
    }

    func test_homeTableView() {
        XCTAssertNil(sut.homeTableView)
    }
    
    func test_for_data_in_cats() {
        XCTAssertNotNil(sut.cats)
    }
    
    func test_for_data_in_apiService() {
        XCTAssertNotNil(sut.apiService)
        
    }
    
    func test_method_getCatData() {
        XCTAssertNotNil(sut.getCatData)
    }
    
    func test_numberOfRowInSection() {
        XCTAssertNotNil(sut.tableView(_:numberOfRowsInSection:))
    }
    
    
}
