//
//  AbstractCoordinator.swift
//  RSJ
//
//  Created by Rael San Juan on 5/10/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

open class AbstractCoordinator: RSJObject, Coordinator {
    override public init() {
        guard type(of: self) != AbstractCoordinator.self else {
            fatalError(
                "AbstractCoordinator instances cannot be created. Use subclasses instead"
            )
        }
        super.init()
    }

    // MARK: Stored Properties
    private var _childCoordinators: [Coordinator] = []
    public private(set) var hasStarted: Bool = false

    // MARK: Computed Properties
    public var childCoordinators: [Coordinator] {
        return self._childCoordinators
    }

    // MARK: Instance Methods
    open func start() {
        switch self.hasStarted {
            case true:
                fatalError(
                    """
                    \(#function) has already been called once in the lifetime of this coordinator.
                    \(#function) is only intended to be called once.
                    """
                )

            case false:
                self.hasStarted = true
        }
    }

    public func add(childCoordinator coordinator: Coordinator) {
        self._childCoordinators.append(coordinator)
    }

    public func remove(childCoordinator coordinator: Coordinator) {
        self._childCoordinators = self.childCoordinators.filter { $0 !== coordinator }
    }
}
