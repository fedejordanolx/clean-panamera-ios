//
//  HomeNetworkManager.swift
//  clean-panamera-ios
//
//  Created by OLX - Federico Jordan on 5/10/17.
//  Copyright © 2017 OLX. All rights reserved.
//

import Foundation
import Alamofire

protocol HomeNetwork {
    func getAdsFirstPage(completion: ([Ad]) -> Void)
}

class HomeNetworkManager: NetworkManager, HomeNetwork {
    
    func getAdsFirstPage(completion: ([Ad]) -> Void) {
        var ads = [Ad]()
        for _ in 0...10 {
            ads.append(Ad())
        }
        completion(ads)
    }
}
