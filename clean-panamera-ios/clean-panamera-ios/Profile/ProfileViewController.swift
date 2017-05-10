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
    
    var profileNetworkManager: ProfileNetworkManager
    var profile: Profile
    
    init(withProfileNetworkManager profileNetworkManager: ProfileNetworkManager, profile: Profile) {
        self.profileNetworkManager = profileNetworkManager
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
        profileNetworkManager.getProfile(withId: profile.id) { (profile: Profile) in
            self.profile = profile
            self.updateWithProfile()
        }
    }
}

// MARK:- Interface
extension ProfileViewController {
    
    func setupInterface() {
        updateWithProfile()
    }
    
    func updateWithProfile() {
        profileLabel.text = profile.name
        profileImageView.image = profile.image
    }
}
