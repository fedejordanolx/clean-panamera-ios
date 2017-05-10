//
//  ProfileNetworkManager.swift
//  clean-panamera-ios
//
//  Created by OLX - Federico Jordan on 5/10/17.
//  Copyright © 2017 OLX. All rights reserved.
//

import Foundation

protocol ProfileNetwork {
    func getProfile(withId id: Int, completion: (Profile) -> Void)
}

class ProfileNetworkManager: NetworkManager, ProfileNetwork {
    
    func getProfile(withId id: Int, completion: (Profile) -> Void) {
        completion(Profile())
    }
}
