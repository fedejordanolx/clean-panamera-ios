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
    
    // MARK:- Outputs
    func show(profile: Profile, fromViewController viewController: UIViewController)
}


class ProfileRouter: ProfileRouteable {
    
    var viewControllersFactory: ProfileViewControllersFactoreable
    
    init(withProfileViewControllersFactory profileViewControllersFactory: ProfileViewControllersFactory = ProfileViewControllersFactory()) {
        self.viewControllersFactory = profileViewControllersFactory
    }
    
    func show(profile: Profile, fromViewController viewController: UIViewController) {
        let profileViewController = viewControllersFactory.profileViewController(withProfile: profile)
        viewController.show(profileViewController, sender: nil)
    }
}
