//
//  AdTests.swift
//  clean-panamera-ios
//
//  Created by OLX - Federico Jordan on 5/12/17.
//  Copyright © 2017 OLX. All rights reserved.
//

import UIKit
import XCTest
@testable import clean_panamera_ios

class AdTests: XCTestCase {

    func testAdViewControllerLabelsSetup() {
        // Given
        let mockedRouter = MockedRouter()
        let adNetworkManager = AdNetworkManager()
        var ad = Ad()
        ad.title = "TestTitle"
        ad.description = "TestDescription"
        let adViewController = AdViewController(withAdRouteable: mockedRouter, adNetwork: adNetworkManager, ad: ad)
        
        // When
        adViewController.loadView()
        adViewController.updateWithAd()
        
        // Verify
        XCTAssert(adViewController.adTitleLabel.text! == "TestTitle")
        XCTAssert(adViewController.adDescriptionLabel.text! == "TestDescription")
    }
    
    func testAdProfileViewControllerLabelSetup() {
        // Given
        let mockedRouter = MockedRouter()
        var adProfile = Profile()
        adProfile.name = "TestProfile"
        let adProfileViewController = AdProfileViewController(withAdRouteable: mockedRouter, adProfile: adProfile)
        
        // When
        adProfileViewController.loadView()
        adProfileViewController.updateWithAdProfile()
        
        // Verify
        XCTAssert(adProfileViewController.adProfileLabel.text! == "TestProfile")
    }
}
