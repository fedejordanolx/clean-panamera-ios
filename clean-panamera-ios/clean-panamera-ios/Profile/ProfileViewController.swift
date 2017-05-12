//
//  ProfileViewController.swift
//  clean-panamera-ios
//
//  Created by OLX - Federico Jordan on 5/9/17.
//  Copyright © 2017 OLX. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet fileprivate weak var profileLabel: UILabel!
    @IBOutlet fileprivate weak var profileImageView: UIImageView!
    @IBOutlet fileprivate weak var profileAdsContainerView: UIView!
    
    var profileNetwork: ProfileNetwork
    var profileRouteable: ProfileRouteable
    var profile: Profile
    
    init(withProfileRouteable profileRouteable: ProfileRouteable, profileNetwork: ProfileNetwork, profile: Profile) {
        self.profileRouteable = profileRouteable
        self.profileNetwork = profileNetwork
        self.profile = profile
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupInterface()
        loadData()
    }
}

// MARK:- Load data
extension ProfileViewController {
    
    func loadData() {
        profileNetwork.getProfile(withId: profile.id) { (profile: Profile) in
            self.profile = profile
            self.updateWithProfile()
        }
    }
}

// MARK:- Interface
extension ProfileViewController {
    
    func setupInterface() {
        updateWithProfile()
        profileRouteable.display(adsFromProfile: profile, onView: profileAdsContainerView, fromViewController: self)
    }
    
    func updateWithProfile() {
        profileLabel.text = profile.name
        profileImageView.image = profile.image
    }
}

// MARK:- Actions
extension ProfileViewController {
    
    @IBAction private func didTapOnImage() {
        guard let image = profileImageView.image else { return }
        profileRouteable.didTap(onProfileImage: image, fromViewController: self)
    }
}
