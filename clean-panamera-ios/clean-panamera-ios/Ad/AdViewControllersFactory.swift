//
//  AdViewControllersFactory.swift
//  clean-panamera-ios
//
//  Created by OLX - Federico Jordan on 5/10/17.
//  Copyright © 2017 OLX. All rights reserved.
//

import Foundation

protocol AdViewControllersFactoreable {
    func adViewController(withAdRouter adRouter: AdRouter, ad: Ad) -> AdViewController
}

class AdViewControllersFactory: AdViewControllersFactoreable {
    
    func adViewController(withAdRouter adRouter: AdRouter, ad: Ad) -> AdViewController {
        let adViewController = AdViewController(withAdRouter: adRouter, adNetworkManager: AdNetworkManager(), ad: ad)
        adViewController.title = "Ad detail"
        return adViewController
    }
}
