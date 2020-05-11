//
//  AppCoordinator.swift
//  RSJ
//
//  Created by Rael San Juan on 5/10/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import class UIKit.UIWindow
import class UIKit.UIViewController

open class AppCoordinator<RootViewController: UIViewController>: AbstractCoordinator {

    // MARK: Initializer
    public init(window: UIWindow, rootViewController: RootViewController) {
        self.window = window
        self.rootViewController = rootViewController
        super.init()
    }

    // MARK: Stored Properties
    public let window: UIWindow
    public let rootViewController: RootViewController
}
