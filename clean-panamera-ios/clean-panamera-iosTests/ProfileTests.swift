//
//  ProfileTests.swift
//  clean-panamera-ios
//
//  Created by OLX - Federico Jordan on 5/12/17.
//  Copyright © 2017 OLX. All rights reserved.
//

import XCTest
@testable import clean_panamera_ios

class ProfileTests: XCTestCase {
    
    func testProfileViewControllerLabelSetup() {
        // Given
        var profile = Profile()
        profile.name = "TestProfile"
        let mockedRouter = MockedRouter()
        let profileNetworkManager = ProfileNetworkManager()
        let profileViewController = ProfileViewController(withProfileRouteable: mockedRouter, profileNetwork: profileNetworkManager, profile: profile)
        
        // When
        profileViewController.loadView()
        profileViewController.updateWithProfile()
        
        // Verify
        XCTAssert(profileViewController.profileLabel.text! == "TestProfile")
    }
    
    func testProfileAdCellsCount() {
        // Given
        let mockedRouter = MockedRouter()
        let profileNetworkManager = ProfileNetworkManager()
        let profile = Profile()
        let profileAdsViewController = ProfileAdsViewController(withProfileRouteable: mockedRouter, profileNetwork: profileNetworkManager, profile: profile)
        profileAdsViewController.profileAds = [Ad(), Ad(), Ad()]

        // When
        profileAdsViewController.loadView()
        profileAdsViewController.setupTableView()
        profileAdsViewController.profileAdsTableView.reloadData()
        
        // Verify
        let rowsCount = profileAdsViewController.profileAdsTableView.numberOfRows(inSection: 0)
        XCTAssert(rowsCount == 3)
    }
    
    func testProfileAdCellLabelSetup() {
        // Given
        let mockedRouter = MockedRouter()
        let profileNetworkManager = ProfileNetworkManager()
        let profile = Profile()
        let profileAdsViewController = ProfileAdsViewController(withProfileRouteable: mockedRouter, profileNetwork: profileNetworkManager, profile: profile)
        var ad = Ad()
        ad.title = "TestTitle"
        profileAdsViewController.profileAds = [ad]
        
        // When
        profileAdsViewController.loadView()
        profileAdsViewController.setupTableView()
        profileAdsViewController.profileAdsTableView.reloadData()
        let profileAdCell = profileAdsViewController.tableView(profileAdsViewController.profileAdsTableView, cellForRowAt: IndexPath(row: 0, section: 0)) as! ProfileAdCell
        
        // Verify
        XCTAssert(profileAdCell.profileAdLabel.text! == "TestTitle")
    }
    
}
