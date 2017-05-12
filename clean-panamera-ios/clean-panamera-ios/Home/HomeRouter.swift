//
//  HomeRouter.swift
//  clean-panamera-ios
//
//  Created by OLX - Federico Jordan on 5/9/17.
//  Copyright © 2017 OLX. All rights reserved.
//

import UIKit

protocol HomeRouteable {
    // MARK:- Inputs
    func didTap(onAd ad: Ad, fromViewController viewController: UIViewController)
    
    // MARK:- Outputs
    func setup(window: inout UIWindow?)
}

class HomeRouter: HomeRouteable {
    
    func didTap(onAd ad: Ad, fromViewController viewController: UIViewController) {
        let adRouter = AdRouter()
        adRouter.show(ad: ad, fromViewController: viewController)
    }
    
    func setup(window: inout UIWindow?) {
        window = UIWindow()
        window?.rootViewController = rootViewController(withHomeRouter: self)
        window?.makeKeyAndVisible()
    }
    
    private func rootViewController(withHomeRouter homeRouter: HomeRouter) -> UINavigationController {
        let homeViewController = self.homeViewController(withHomeRouter: homeRouter)
        let navigationController = UINavigationController(rootViewController: homeViewController)
        navigationController.navigationBar.isOpaque = true
        navigationController.navigationBar.isTranslucent = false
        return navigationController
    }
    
    private func homeViewController(withHomeRouter homeRouter: HomeRouter) -> HomeViewController {
        let homeViewController = HomeViewController(withHomeRouter: homeRouter, homeNetworkManager: HomeNetworkManager())
        homeViewController.title = "Home"
        return homeViewController
    }
}


