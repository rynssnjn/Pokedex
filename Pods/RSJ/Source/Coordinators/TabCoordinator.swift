//
//  TabCoordinator.swift
//  RSJ
//
//  Created by Rael San Juan on 5/10/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import class UIKit.UIViewController
import class UIKit.UITabBarItem

public protocol TabCoordinator: Coordinator {

    associatedtype ViewController: UIViewController

    var viewController: ViewController { get }

    var tabBarItem: UITabBarItem { get }

}
