//
//  ProfileRouter.swift
//  clean-panamera-ios
//
//  Created by OLX - Federico Jordan on 5/10/17.
//  Copyright © 2017 OLX. All rights reserved.
//

import UIKit

protocol ProfileRouteable {    
    // MARK:- Inputs
    func didSelect(profileAd: Ad, fromViewController viewController: UIViewController)
    func didTap(onProfileImage profileImage: UIImage, fromViewController viewController: UIViewController)

    // MARK:- Embed
    func display(adsFromProfile profile: Profile, onView containerView: UIView, fromViewController viewController: UIViewController)
    
    // MARK:- Outputs
    func show(profile: Profile, fromViewController viewController: UIViewController)
}


class ProfileRouter: ProfileRouteable {
    
    func didSelect(profileAd: Ad, fromViewController viewController: UIViewController) {
        let adRouter = AdRouter()
        adRouter.show(ad: profileAd, fromViewController: viewController)
    }
    
    func didTap(onProfileImage profileImage: UIImage, fromViewController viewController: UIViewController) {
        let galleryRouter = GalleryRouter()
        galleryRouter.showFullScreen(withImage: profileImage, fromViewController: viewController)
    }
    
    func display(adsFromProfile profile: Profile, onView containerView: UIView, fromViewController viewController: UIViewController) {
        let profileAdsViewController = ProfileAdsViewController(withProfileRouteable: self, profileNetwork: ProfileNetworkManager(), profile: profile)
        viewController.display(childViewController: profileAdsViewController, inContainerView: containerView)
    }

    
    func show(profile: Profile, fromViewController viewController: UIViewController) {
        if let previousProfileViewController = previouslyLoadedView(withProfile: profile, fromViewController: viewController) {
            _ = viewController.navigationController?.popToViewController(previousProfileViewController, animated: true)
        } else {
            let profileViewController = ProfileViewController(withProfileRouteable: self, profileNetwork: ProfileNetworkManager(), profile: profile)
            profileViewController.title = "Profile"
            viewController.show(profileViewController, sender: nil)
        }
    }
    
}

// MARK:- Utils
extension ProfileRouter {
    
    fileprivate func previouslyLoadedView(withProfile profile: Profile, fromViewController viewController: UIViewController) -> ProfileViewController? {
        guard let navigationController = viewController.navigationController else { return nil }
        for previousViewController in navigationController.viewControllers {
            if let profileViewController = previousViewController as? ProfileViewController, profileViewController.profile.id == profile.id {
                return profileViewController
            }
        }
        return nil
    }
}

//protocol PreviouslyLoadable {
//    
//    func previouslyLoadedView<T, U>(withObject object: T, fromViewController viewController: UIViewController) -> U?
//    
//}
//
//extension PreviouslyLoadable {
//    
//    func previouslyLoadedView<T: Hashable, U: UIViewController>(withObject object: T, fromViewController viewController: UIViewController) -> U? {
//        guard let navigationController = viewController.navigationController else { return nil }
//        for previousViewController in navigationController.viewControllers {
//            if let objectViewController = previousViewController as? U, profileViewController.profile.id == profile.id {
//                return profileViewController
//            }
//        }
//        return nil
//    }
//    }
//}
//
//
//}
