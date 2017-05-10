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
    
    // MARK:- Inputs
    func didTap(onProfile profile: Profile, fromViewController viewController: UIViewController)
    
    // MARK:- Outputs
    func show(ad: Ad, fromViewController viewController: UIViewController)
    
    // MARK:- Embeds
    func display(adProfile: Profile, onView containerView: UIView, fromViewController viewController: UIViewController)
}

class AdRouter: AdRouteable {
    
    var viewControllersFactory: AdViewControllersFactoreable
    
    init(withAdViewControllersFactory adViewControllersFactory: AdViewControllersFactory = AdViewControllersFactory()) {
        self.viewControllersFactory = adViewControllersFactory
    }
    
    func didTap(onProfile profile: Profile, fromViewController viewController: UIViewController) {
        let profileRouter = ProfileRouter()
        profileRouter.show(profile: profile, fromViewController: viewController)
    }
    
    func show(ad: Ad, fromViewController viewController: UIViewController) {
        let adViewController = viewControllersFactory.adViewController(withAdRouteable: self, ad: ad)
        viewController.show(adViewController, sender: nil)
    }
    
    func display(adProfile: Profile, onView containerView: UIView, fromViewController viewController: UIViewController) {
        
        let adProfileViewController = viewControllersFactory.adProfileViewController(withAdRouteable: self, adProfile: adProfile)
        viewController.display(childViewController: adProfileViewController, inContainerView: containerView)
    }

}
