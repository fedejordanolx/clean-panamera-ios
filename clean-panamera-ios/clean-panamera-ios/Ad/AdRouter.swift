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
    
    // MARK:- Embeds
    func display(adProfile: Profile, onView containerView: UIView, fromViewController viewController: UIViewController)
    
    // MARK:- Outputs
    func show(ad: Ad, fromViewController viewController: UIViewController)
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
    
    func display(adProfile: Profile, onView containerView: UIView, fromViewController viewController: UIViewController) {
        let adProfileViewController = viewControllersFactory.adProfileViewController(withAdRouteable: self, adProfile: adProfile)
        viewController.display(childViewController: adProfileViewController, inContainerView: containerView)
    }
    
    func show(ad: Ad, fromViewController viewController: UIViewController) {
        if let previousAdViewController = previouslyLoadedView(withAd: ad, fromViewController: viewController) {
            _ = viewController.navigationController?.popToViewController(previousAdViewController, animated: true)
        } else {
            let adViewController = viewControllersFactory.adViewController(withAdRouteable: self, ad: ad)
            viewController.show(adViewController, sender: nil)
        }
    }

}

// MARK:- Utils
extension AdRouter {
    
    fileprivate func previouslyLoadedView(withAd ad: Ad, fromViewController viewController: UIViewController) -> AdViewController? {
        guard let navigationController = viewController.navigationController else { return nil }
        for previousViewController in navigationController.viewControllers {
            if let adViewController = previousViewController as? AdViewController, adViewController.ad.id == ad.id {
                return adViewController
            }
        }
        return nil
    }
}
