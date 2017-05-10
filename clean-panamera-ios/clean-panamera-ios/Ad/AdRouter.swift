//
//  AdRouter.swift
//  clean-panamera-ios
//
//  Created by OLX - Federico Jordan on 5/10/17.
//  Copyright © 2017 OLX. All rights reserved.
//

import UIKit

protocol AdRouteable {
    var viewControllersFactory: AdViewControllersFactoreable { get }
    
    // MARK:- Outputs
    func show(ad: Ad, fromViewController viewController: UIViewController)
}

class AdRouter: AdRouteable {
    
    var viewControllersFactory: AdViewControllersFactoreable
    
    init(withAdViewControllersFactory adViewControllersFactory: AdViewControllersFactory = AdViewControllersFactory()) {
        self.viewControllersFactory = adViewControllersFactory
    }
    
    func show(ad: Ad, fromViewController viewController: UIViewController) {
        let adViewController = viewControllersFactory.adViewController(withAdRouter: self, ad: ad)
        viewController.show(adViewController, sender: nil)
    }
}
