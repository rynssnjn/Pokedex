//
//  Coordinator.swift
//  RSJ
//
//  Created by Rael San Juan on 5/10/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

public protocol Coordinator: class {

    var childCoordinators: [Coordinator] { get }

    func add(childCoordinator coordinator: Coordinator)

    func remove(childCoordinator coordinator: Coordinator)

    func start()

}

