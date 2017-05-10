//
//  Router.swift
//  clean-panamera-ios
//
//  Created by OLX - Federico Jordan on 5/9/17.
//  Copyright © 2017 OLX. All rights reserved.
//

import Foundation

protocol Routeable {
    var viewControllersFactory: ViewControllersFactoreable { get }
}

class Router: Routeable {
    var viewControllersFactory: ViewControllersFactoreable
    
    init(withViewControllersFactory viewControllersFactory: ViewControllersFactoreable = ViewControllersFactory()) {
        self.viewControllersFactory = viewControllersFactory
    }
}
