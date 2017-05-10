//
//  AdProfileViewController.swift
//  clean-panamera-ios
//
//  Created by OLX - Federico Jordan on 5/10/17.
//  Copyright © 2017 OLX. All rights reserved.
//

import UIKit

class AdProfileViewController: UIViewController {
    
    @IBOutlet fileprivate weak var adProfileImageView: UIImageView!
    @IBOutlet fileprivate weak var adProfileLabel: UILabel!
    
    var adProfile: Profile
    var adRouteable: AdRouteable
    
    init(withAdRouteable adRouteable: AdRouteable, adProfile: Profile) {
        self.adProfile = adProfile
        self.adRouteable = adRouteable
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupInterface()
    }

}

// MARK:- Interface
extension AdProfileViewController {
    
    func setupInterface() {
        updateWithAdProfile()
    }
    
    func updateWithAdProfile() {
        adProfileLabel.text = adProfile.name
        adProfileImageView.image = adProfile.image
    }
}

// MARK:- Actions
extension AdProfileViewController {
    
    @IBAction func didSelectProfile(sender: AnyObject) {
        adRouteable.didTap(onProfile: adProfile, fromViewController: self)
    }
}
