//
//  PokedexAppCoordinator.swift
//  Pokedex
//
//  Created by Rael San Juan on 10/11/2019.
//  Copyright © 2019 Rael San Juan. All rights reserved.
//

import Foundation
import Kio

public final class PokedexAppCoordinator: AppCoordinator<UINavigationController> {

    // MARK: Initializer
    public override init(window: UIWindow, rootViewController: UINavigationController) {
        super.init(window: window, rootViewController: rootViewController)

        // MARK: Setup window property
        self.window.backgroundColor = UIColor.white
        self.window.rootViewController = self.rootViewController
        self.window.makeKeyAndVisible()

        self.rootViewController.navigationBar.isTranslucent = false
    }

    // MARK: Instance Methods
    public override func start() {
        super.start()
        let pokedexListCoordinator: PokedexListCoordinator = PokedexListCoordinator(
            navigationController: self.rootViewController
        )
        
        pokedexListCoordinator.start()
        self.add(childCoordinator: pokedexListCoordinator)

    }
}
