//
//  ProfileAdCell.swift
//  clean-panamera-ios
//
//  Created by OLX - Federico Jordan on 5/12/17.
//  Copyright © 2017 OLX. All rights reserved.
//

import UIKit
import DequeuableRegistrable

class ProfileAdCell: UITableViewCell, Registrable, Dequeuable {
    
    @IBOutlet fileprivate weak var profileAdImageView: UIImageView!
    @IBOutlet fileprivate weak var profileAdLabel: UILabel!
    
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
extension ProfileAdCell {
    
    func setup(withProfileAd profileAd: Ad) {
        profileAdImageView.image = profileAd.image
        profileAdLabel.text = profileAd.title
    }
}
