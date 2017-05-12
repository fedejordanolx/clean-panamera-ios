//
//  ProfileRouter.swift
//  clean-panamera-ios
//
//  Created by OLX - Federico Jordan on 5/10/17.
//  Copyright © 2017 OLX. All rights reserved.
//

import UIKit

protocol ProfileRouteable {
    var viewControllersFactory: ProfileViewControllersFactoreable { get }
    
    // MARK:- Inputs
    func didSelect(profileAd: Ad, fromViewController viewController: UIViewController)
    
    // MARK:- Embed
    func display(adsFromProfile profile: Profile, onView containerView: UIView, fromViewController viewController: UIViewController)
    
    // MARK:- Outputs
    func show(profile: Profile, fromViewController viewController: UIViewController)
}


class ProfileRouter: ProfileRouteable {
    
    var viewControllersFactory: ProfileViewControllersFactoreable
    
    init(withProfileViewControllersFactory profileViewControllersFactory: ProfileViewControllersFactory = ProfileViewControllersFactory()) {
        self.viewControllersFactory = profileViewControllersFactory
    }
    
    func didSelect(profileAd: Ad, fromViewController viewController: UIViewController) {
        let adRouter = AdRouter()
        adRouter.show(ad: profileAd, fromViewController: viewController)
    }
    
    func display(adsFromProfile profile: Profile, onView containerView: UIView, fromViewController viewController: UIViewController) {
        let profileAdsViewController = viewControllersFactory.profileAdsViewController(withProfileRouteable: self, profile: profile)
        viewController.display(childViewController: profileAdsViewController, inContainerView: containerView)
    }

    
    func show(profile: Profile, fromViewController viewController: UIViewController) {
        let profileViewController = viewControllersFactory.profileViewController(withProfileRouteable: self, profile: profile)
        viewController.show(profileViewController, sender: nil)
    }
    
}
