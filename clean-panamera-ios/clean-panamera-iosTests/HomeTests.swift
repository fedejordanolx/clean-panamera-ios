//
//  HomeTests.swift
//  clean-panamera-ios
//
//  Created by OLX - Federico Jordan on 5/10/17.
//  Copyright © 2017 OLX. All rights reserved.
//

import XCTest
@testable import clean_panamera_ios

class HomeTests: XCTestCase {
    
    var mockedRouter = MockedRouter()
    let homeNetworkManager = HomeNetworkManager()
    
    func testHomeAdsCount() {
        // Given
        let homeViewController = HomeViewController(withHomeRouter: mockedRouter, homeNetworkManager: homeNetworkManager)
        let ads = [Ad(), Ad(), Ad()]
        
        // When
        homeViewController.loadView()
        homeViewController.setupInterface()
        homeViewController.ads = ads
        homeViewController.adsTableView.reloadData()
        
        // Verify
        let rowsCount = homeViewController.adsTableView.numberOfRows(inSection: 0)
        XCTAssert(rowsCount == 3)
    }
    
    func testHomeAdCellLabelsSetup() {
        // Given
        let homeViewController = HomeViewController(withHomeRouter: mockedRouter, homeNetworkManager: homeNetworkManager)
        var ad = Ad()
        ad.title = "TestTitle"
        ad.description = "TestDescription"
        homeViewController.ads = [ad]
        
        // When
        homeViewController.loadView()
        homeViewController.setupInterface()
        homeViewController.adsTableView.reloadData()
        let homeAdCell = homeViewController.tableView(homeViewController.adsTableView, cellForRowAt: IndexPath(row: 0, section: 0)) as! HomeAdCell
        
        // Verify
        XCTAssert(homeAdCell.titleLabel.text! == "TestTitle")
        XCTAssert(homeAdCell.descriptionLabel.text! == "TestDescription")
    }
}
