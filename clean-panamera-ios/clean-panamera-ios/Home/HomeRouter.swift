//
//  HomeRouter.swift
//  clean-panamera-ios
//
//  Created by OLX - Federico Jordan on 5/9/17.
//  Copyright © 2017 OLX. All rights reserved.
//

import UIKit

protocol HomeRouteable {
    var viewControllersFactory: HomeViewControllersFactoreable { get }
    
    // MARK:- Inputs
    func didTap(onAd ad: Ad, fromViewController viewController: UIViewController)
    
    // MARK:- Outputs
    func setup(window: inout UIWindow?)
}

class HomeRouter: HomeRouteable {
    
    var viewControllersFactory: HomeViewControllersFactoreable
    
    init(withHomeViewControllersFactory homeViewControllersFactory: HomeViewControllersFactory = HomeViewControllersFactory()) {
        self.viewControllersFactory = homeViewControllersFactory
    }
    
    func didTap(onAd ad: Ad, fromViewController viewController: UIViewController) {
        let adRouter = AdRouter()
        adRouter.show(ad: ad, fromViewController: viewController)
    }
    
    func setup(window: inout UIWindow?) {
        window = UIWindow()
        window?.rootViewController = viewControllersFactory.rootViewController(withHomeRouter: self)
        window?.makeKeyAndVisible()
    }
}
