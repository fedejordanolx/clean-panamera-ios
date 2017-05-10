//
//  HomeAdCell.swift
//  clean-panamera-ios
//
//  Created by OLX - Federico Jordan on 5/10/17.
//  Copyright © 2017 OLX. All rights reserved.
//

import UIKit
import AlamofireImage
import DequeuableRegistrable

class HomeAdCell: UITableViewCell, Registrable, Dequeuable {
    
    @IBOutlet fileprivate weak var titleLabel: UILabel!
    @IBOutlet fileprivate weak var descriptionLabel: UILabel!
    @IBOutlet fileprivate weak var adImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

// MARK:- Setup
extension HomeAdCell {
    
    func setup(withAd ad: Ad) {
        titleLabel.text = ad.title
        descriptionLabel.text = ad.description
        adImageView.image = ad.image
    }
}
