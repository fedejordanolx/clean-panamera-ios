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
    @IBOutlet fileprivate weak var adProfileContainerView: UIView!
    
    var adRouteable: AdRouteable
    var adNetworkManager: AdNetworkManager
    var ad: Ad
    
    init(withAdRouteable adRouteable: AdRouteable, adNetworkManager: AdNetworkManager, ad: Ad) {
        self.adRouteable = adRouteable
        self.adNetworkManager = adNetworkManager
        self.ad = ad
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupInterface()
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
        adRouteable.display(adProfile: ad.profile, onView: adProfileContainerView, fromViewController: self)
    }
    
    func updateWithAd() {
        adTitleLabel.text = ad.title
        adDescriptionLabel.text = ad.description
        adImageView.image = ad.image
    }
}
