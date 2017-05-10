//
//  AdNetworkManager.swift
//  clean-panamera-ios
//
//  Created by OLX - Federico Jordan on 5/10/17.
//  Copyright © 2017 OLX. All rights reserved.
//

import UIKit

protocol AdNetwork {
    func getAd(withId id: Int, completion: (Ad) -> Void)
}

class AdNetworkManager: NetworkManager, AdNetwork {

    func getAd(withId id: Int, completion: (Ad) -> Void) {
        completion(Ad())
    }
}
