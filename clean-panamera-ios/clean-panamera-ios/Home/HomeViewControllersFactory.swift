//
//  HomeViewControllersFactory.swift
//  clean-panamera-ios
//
//  Created by OLX - Federico Jordan on 5/9/17.
//  Copyright © 2017 OLX. All rights reserved.
//

import UIKit

protocol HomeViewControllersFactoreable {
    func rootViewController(withHomeRouter homeRouter: HomeRouter) -> UINavigationController
    func homeViewController(withHomeRouter homeRouter: HomeRouter) -> HomeViewController
}

class HomeViewControllersFactory: HomeViewControllersFactoreable {
    
    func rootViewController(withHomeRouter homeRouter: HomeRouter) -> UINavigationController {
        let homeViewController = self.homeViewController(withHomeRouter: homeRouter)
        let navigationController = UINavigationController(rootViewController: homeViewController)
        navigationController.navigationBar.isOpaque = true
        navigationController.navigationBar.isTranslucent = false
        return navigationController
    }
    
    func homeViewController(withHomeRouter homeRouter: HomeRouter) -> HomeViewController {
        let homeViewController = HomeViewController(withHomeRouter: homeRouter, homeNetworkManager: HomeNetworkManager())
        homeViewController.title = "Home"
        return homeViewController
    }
}
