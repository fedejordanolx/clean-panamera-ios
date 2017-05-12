//
//  ProfileAdsViewController.swift
//  clean-panamera-ios
//
//  Created by OLX - Federico Jordan on 5/12/17.
//  Copyright © 2017 OLX. All rights reserved.
//

import UIKit

class ProfileAdsViewController: UIViewController {

    @IBOutlet fileprivate weak var profileAdsTableView: UITableView!
    
    var profileRouteable: ProfileRouteable
    var profileNetwork: ProfileNetwork
    var profileAds: [Ad]
    var profile: Profile
    
    init(withProfileRouteable profileRouteable: ProfileRouteable, profileNetwork: ProfileNetwork, profile: Profile) {
        self.profileRouteable = profileRouteable
        self.profileNetwork = profileNetwork
        self.profileAds = profile.ads
        self.profile = profile
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        loadData()
    }

}

// MARK:- Interface
extension ProfileAdsViewController {
    
    func setupTableView() {
        ProfileAdCell.register(in: profileAdsTableView)
    }
}

// MARK:- Load data
extension ProfileAdsViewController {
    
    func loadData() {
        profileNetwork.getAds(forProfile: profile) { (profileAds: [Ad]) in
            self.profileAds = profileAds
            self.profileAdsTableView.reloadData()
        }
    }
}

// MARK:- UITableViewDataSource
extension ProfileAdsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profileAds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ProfileAdCell.dequeue(from: profileAdsTableView)
        let profileAd = profileAds[indexPath.row]
        cell.setup(withProfileAd: profileAd)
        return cell
    }
}

// MARK:- UITableViewDelegate
extension ProfileAdsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let profileAd = profileAds[indexPath.row]
        profileRouteable.didSelect(profileAd: profileAd, fromViewController: self)
    }
}
