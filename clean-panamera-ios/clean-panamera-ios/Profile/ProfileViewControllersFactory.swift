//
//  ProfileViewControllersFactory.swift
//  clean-panamera-ios
//
//  Created by OLX - Federico Jordan on 5/10/17.
//  Copyright © 2017 OLX. All rights reserved.
//

import Foundation

protocol ProfileViewControllersFactoreable {
    func profileViewController(withProfile profile: Profile) -> ProfileViewController
}

class ProfileViewControllersFactory: ProfileViewControllersFactoreable {
    
    func profileViewController(withProfile profile: Profile) -> ProfileViewController {
        let profileViewController = ProfileViewController(withProfileNetworkManager: ProfileNetworkManager(), profile: profile)
        profileViewController.title = "Profile"
        return profileViewController
    }
}
