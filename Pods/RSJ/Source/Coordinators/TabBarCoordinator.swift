//
//  TabBarCoordinator.swift
//  RSJ
//
//  Created by Rael San Juan on 5/10/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

public protocol TabBarCoordinator: Coordinator {

    var tabs: [AnyTabCoordinator] { get set }

    func degenericize<T: TabCoordinator>(_ coordinator: T) -> AnyTabCoordinator

    func degenericize<T: TabCoordinator>(_ coordinators: [T]) -> [AnyTabCoordinator]

}

public extension TabBarCoordinator {

    func degenericize<T: TabCoordinator>(_ coordinator: T) -> AnyTabCoordinator {
        return AnyTabCoordinator(coordinator)
    }

    func degenericize<T: TabCoordinator>(_ coordinators: [T]) -> [AnyTabCoordinator] {
        return coordinators.map(AnyTabCoordinator.init)
    }
}
