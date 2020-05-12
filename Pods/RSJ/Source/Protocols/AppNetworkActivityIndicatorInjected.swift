//
//  AppNetworkActivityIndicatorInjected.swift
//  RSJ
//
//  Created by Rael San Juan on 5/10/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import class Foundation.DispatchQueue
import class UIKit.UIApplication

public protocol AppNetworkActivityIndicatorInjected: class {}

public extension AppNetworkActivityIndicatorInjected {

    var showActivityIndicator: Bool {
        set {
            DispatchQueue.main.async {
                UIApplication.shared.isNetworkActivityIndicatorVisible = newValue
            }
        }

        get {
            return UIApplication.shared.isNetworkActivityIndicatorVisible
        }
    }

}
