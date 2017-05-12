//
//  ProfileViewControllersFactory.swift
//  clean-panamera-ios
//
//  Created by OLX - Federico Jordan on 5/10/17.
//  Copyright © 2017 OLX. All rights reserved.
//

import Foundation

protocol ProfileViewControllersFactoreable {
    func profileViewController(withProfileRouteable profileRouteable: ProfileRouteable, profile: Profile) -> ProfileViewController
    func profileAdsViewController(withProfileRouteable profileRouteable: ProfileRouteable, profile: Profile) -> ProfileAdsViewController
}

class ProfileViewControllersFactory: ProfileViewControllersFactoreable {
    
    func profileViewController(withProfileRouteable profileRouteable: ProfileRouteable, profile: Profile) -> ProfileViewController {
        let profileViewController = ProfileViewController(withProfileRouteable: profileRouteable, profileNetwork: ProfileNetworkManager(), profile: profile)
        profileViewController.title = "Profile"
        return profileViewController
    }
    
    func profileAdsViewController(withProfileRouteable profileRouteable: ProfileRouteable, profile: Profile) -> ProfileAdsViewController {
        let profileAdsViewController = ProfileAdsViewController(withProfileRouteable: profileRouteable, profileNetwork: ProfileNetworkManager(), profile: profile)
        return profileAdsViewController
    }
}
