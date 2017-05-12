//
//  MockRouter.swift
//  clean-panamera-ios
//
//  Created by OLX - Federico Jordan on 5/12/17.
//  Copyright © 2017 OLX. All rights reserved.
//

import UIKit
@testable import clean_panamera_ios

class MockedRouter {}

extension MockedRouter: HomeRouteable {
    
    func didTap(onAd ad: Ad, fromViewController viewController: UIViewController) {
        print("Requested did tap on ad")
    }
    
    func setup(window: inout UIWindow?) {
        print("Requested setup")
    }
}

extension MockedRouter: AdRouteable {
    
    func didTap(onAdImage adImage: UIImage, fromViewController viewController: UIViewController) {
        print("Requested did tap on ad image")
    }
    
    func didTap(onProfile profile: Profile, fromViewController viewController: UIViewController) {
        print("Requested did tap on profile")
    }
    
    func display(adProfile: Profile, onView containerView: UIView, fromViewController viewController: UIViewController) {
        print("Requested display ad profile")
    }
    
    func show(ad: Ad, fromViewController viewController: UIViewController) {
        print("Requested show ad")
    }
}

extension MockedRouter: ProfileRouteable {
    
    func didSelect(profileAd: Ad, fromViewController viewController: UIViewController) {
        print("Requested select profile ad")
    }
    
    func didTap(onProfileImage profileImage: UIImage, fromViewController viewController: UIViewController) {
        print("Requested tap profile image")
    }
    
    func display(adsFromProfile profile: Profile, onView containerView: UIView, fromViewController viewController: UIViewController) {
        print("Requested display ads from profile")
    }
    
    func show(profile: Profile, fromViewController viewController: UIViewController) {
        print("Requested show profile")
    }
}

extension MockedRouter: GalleryRouteable {
    
    func didTapOnImage(fromViewController viewController: UIViewController) {
        print("Requested tap on image")
    }
    
    func showFullScreen(withImage image: UIImage, fromViewController viewController: UIViewController) {
        print("Requested show full screen image")
    }
}
