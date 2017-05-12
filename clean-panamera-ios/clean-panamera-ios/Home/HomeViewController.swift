//
//  ViewController.swift
//  clean-panamera-ios
//
//  Created by OLX - Federico Jordan on 5/9/17.
//  Copyright © 2017 OLX. All rights reserved.
//

import UIKit
import DequeuableRegistrable

class HomeViewController: UIViewController {

    @IBOutlet weak var adsTableView: UITableView!
    
    var homeRouter: HomeRouteable!
    var homeNetworkManager: HomeNetwork!
    var ads: [Ad]
    
    init(withHomeRouter homeRouter: HomeRouteable? = nil, homeNetworkManager: HomeNetwork? = nil) {
        self.homeRouter = homeRouter
        self.homeNetworkManager = homeNetworkManager
        self.ads = [Ad]()
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

// MARK:- Interface
extension HomeViewController {
    
    func setupInterface() {
        HomeAdCell.register(in: adsTableView)
        adsTableView.rowHeight = UITableViewAutomaticDimension
        adsTableView.estimatedRowHeight = 109.0
    }
}

// MARK:- Load data
extension HomeViewController {
    
    func loadData() {
        homeNetworkManager.getAdsFirstPage { (ads:[Ad]) in
            self.ads = ads
            adsTableView.reloadData()
        }
    }
}

// MARK:- UITableViewDatasource
extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ads.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = HomeAdCell.dequeue(from: adsTableView)
        let ad = ads[indexPath.row]
        cell.setup(withAd: ad)
        return cell
    }
}

// MARK:- UITableViewDelegate
extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let ad = ads[indexPath.row]
        homeRouter.didTap(onAd: ad, fromViewController: self)
    }
}

