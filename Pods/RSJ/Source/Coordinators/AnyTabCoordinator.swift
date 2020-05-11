//
//  AnyTabCoordinator.swift
//  RSJ
//
//  Created by Rael San Juan on 5/10/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import class UIKit.UIViewController
import class UIKit.UITabBarItem

open class AnyTabCoordinator {

    // MARK: Initializer
    public init<T: TabCoordinator>(_ tabCoordinator: T) {
        self.viewController = tabCoordinator.viewController
        self.tabBarItem = tabCoordinator.tabBarItem
    }

    // MARK: Stored Properties
    public let viewController: UIViewController
    public let tabBarItem: UITabBarItem
}
