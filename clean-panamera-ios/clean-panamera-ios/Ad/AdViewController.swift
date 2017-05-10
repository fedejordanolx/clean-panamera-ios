//
//  AdViewController.swift
//  clean-panamera-ios
//
//  Created by OLX - Federico Jordan on 5/9/17.
//  Copyright © 2017 OLX. All rights reserved.
//

import UIKit

class AdViewController: UIViewController {
    
    @IBOutlet fileprivate weak var adTitleLabel: UILabel!
    @IBOutlet fileprivate weak var adDescriptionLabel: UILabel!
    @IBOutlet fileprivate weak var adImageView: UIImageView!
    @IBOutlet fileprivate weak var adProfileImageView: UIImageView!
    @IBOutlet fileprivate weak var adProfileLabel: UILabel!
    
    var adRouter: AdRouter
    var adNetworkManager: AdNetworkManager
    var ad: Ad
    
    init(withAdRouter adRouter: AdRouter, adNetworkManager: AdNetworkManager, ad: Ad) {
        self.adRouter = adRouter
        self.adNetworkManager = adNetworkManager
        self.ad = ad
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        adNetworkManager.getAd(withId: ad.id) { (ad: Ad) in
            self.ad = ad
            self.updateWithAd()
        }
    }
    
}

// MARK:- Interface
extension AdViewController {
    
    func setupInterface() {
        updateWithAd()
    }
    
    func updateWithAd() {
        adTitleLabel.text = ad.title
        adDescriptionLabel.text = ad.description
        adImageView.image = ad.image
        adProfileLabel.text = ad.profile.name
        adProfileImageView.image = ad.profile.image
    }
}
