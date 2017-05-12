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
    func getAds(forProfile profile: Profile, completion: ([Ad]) -> Void)
}

class ProfileNetworkManager: NetworkManager, ProfileNetwork {
    
    func getProfile(withId id: Int, completion: (Profile) -> Void) {
        completion(Profile())
    }
    
    func getAds(forProfile profile: Profile, completion: ([Ad]) -> Void) {
        let ad1 = Ad()
        let ad2 = Ad()
        completion([ad1, ad2])
    }
}
