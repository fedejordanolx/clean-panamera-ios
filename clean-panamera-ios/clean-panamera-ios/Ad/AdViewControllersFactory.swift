//
//  AdViewControllersFactory.swift
//  clean-panamera-ios
//
//  Created by OLX - Federico Jordan on 5/10/17.
//  Copyright © 2017 OLX. All rights reserved.
//

import Foundation

protocol AdViewControllersFactoreable {
    func adViewController(withAdRouteable adRouteable: AdRouteable, ad: Ad) -> AdViewController
    func adProfileViewController(withAdRouteable adRouteable: AdRouteable, adProfile: Profile) -> AdProfileViewController
}

class AdViewControllersFactory: AdViewControllersFactoreable {
    
    func adViewController(withAdRouteable adRouteable: AdRouteable, ad: Ad) -> AdViewController {
        let adViewController = AdViewController(withAdRouteable: adRouteable, adNetwork: AdNetworkManager(), ad: ad)
        adViewController.title = "Ad detail"
        return adViewController
    }
    
    func adProfileViewController(withAdRouteable adRouteable: AdRouteable, adProfile: Profile) -> AdProfileViewController {
        let adProfileViewController = AdProfileViewController(withAdRouteable: adRouteable, adProfile: adProfile)
        return adProfileViewController
    }
}
