//
//  GalleryRouter.swift
//  clean-panamera-ios
//
//  Created by OLX - Federico Jordan on 5/12/17.
//  Copyright © 2017 OLX. All rights reserved.
//

import UIKit

protocol GalleryRouteable {
    // MARK:- Inputs
    func didTapOnImage(fromViewController viewController: UIViewController)
    
    // MARK:- Outputs
    func showFullScreen(withImage image: UIImage, fromViewController viewController: UIViewController)
}

class GalleryRouter: GalleryRouteable {

    func didTapOnImage(fromViewController viewController: UIViewController) {
        viewController.dismiss(animated: true, completion: nil)
    }
    
    func showFullScreen(withImage image: UIImage, fromViewController viewController: UIViewController) {
        let galleryViewController = GalleryViewController(withGalleryRouteable: self, image: image)
        viewController.present(galleryViewController, animated: true, completion: nil)
    }
}
