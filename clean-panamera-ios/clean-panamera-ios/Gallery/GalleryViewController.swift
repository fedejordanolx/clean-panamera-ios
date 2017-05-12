//
//  GalleryViewController.swift
//  clean-panamera-ios
//
//  Created by OLX - Federico Jordan on 5/12/17.
//  Copyright © 2017 OLX. All rights reserved.
//

import UIKit

class GalleryViewController: UIViewController {

    @IBOutlet fileprivate weak var imageView: UIImageView!
    
    var galleryRouteable: GalleryRouteable
    var image: UIImage
    
    init(withGalleryRouteable galleryRouteable: GalleryRouteable, image: UIImage) {
        self.galleryRouteable = galleryRouteable
        self.image = image
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
extension GalleryViewController {
    
    func setupInterface() {
        imageView.image = image
    }
}

// MARK:- Actions
extension GalleryViewController {
    
    @IBAction func didTapOnImage(sender: UITapGestureRecognizer) {
        galleryRouteable.didTapOnImage(fromViewController: self)
    }
}
