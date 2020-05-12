//
//  DetailCoordinator.swift
//  Pokedex
//
//  Created by Rael San Juan on 10/11/2019.
//  Copyright © 2019 Rael San Juan. All rights reserved.
//

import Foundation
import RSJ

public final class DetailCoordinator: AbstractCoordinator {
    
    // MARK: Delegate Properties
    private unowned let delegate: DetailCoordinatorDelegate
    
    // MARK: Initializers
    public init(delegate: DetailCoordinatorDelegate, navigationController: UINavigationController, models: DetailModels) {
        self.delegate = delegate
        self.navigationController = navigationController
        self.models = models
        super.init()
    }
    
    // MARK: Stored Properties
    private unowned let navigationController: UINavigationController
    private let models: DetailModels
    
    // MARK: Instance Methods
    public override func start() {
        let descriptionViewModel: DescriptionViewModel = DescriptionViewModel(models: self.models)
        let statsViewModel: StatsViewModel = StatsViewModel(stats: self.models.pokemon.stats)
        let vc: DetailVC = DetailVC(
            delegate: self,
            descriptionViewModel: descriptionViewModel,
            statsViewModel: statsViewModel
        )
        
        self.navigationController.pushViewController(vc, animated: true)
        self.navigationController.navigationBar.barTintColor = descriptionViewModel.color
    }
}

// MARK: DetailVCDelegate Methods
extension DetailCoordinator: DetailVCDelegate {
    public func backButtonItemTapped() {
        self.navigationController.popViewController(animated: true)
        self.delegate.coordinatorDidDismissView(self)
    }
}
