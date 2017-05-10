//
//  UIViewController+childController.swift
//  Letgo
//
//  Created by OLX - Federico Jordan on 10/21/16.
//  Copyright © 2016 OLX. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func display(childViewController: UIViewController, inContainerView containerView: UIView) {
        addChildViewController(childViewController)
        childViewController.view.frame = containerView.bounds
        containerView.addSubview(childViewController.view)
        childViewController.didMove(toParentViewController: self)
        addConstraints(container: containerView, view: childViewController.view)
    }
    
    func remove(childViewController: UIViewController) {
        childViewController.willMove(toParentViewController: nil)
        childViewController.view.removeFromSuperview()
        childViewController.removeFromParentViewController()
    }
    
    private func addConstraints(container: UIView, view: UIView){
        container.addConstraint(NSLayoutConstraint(item: container, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.top, multiplier: 1, constant: 0))
        
        container.addConstraint(NSLayoutConstraint(item: container, attribute: NSLayoutAttribute.right, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.right, multiplier: 1, constant: 0))
        
        container.addConstraint(NSLayoutConstraint(item: container, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.left, multiplier: 1, constant: 0))
        
        container.addConstraint(NSLayoutConstraint(item: container, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.bottom, multiplier: 1, constant: 0))
    }
}

