//
//  PokedexListCoordinator.swift
//  Pokedex
//
//  Created by Rael San Juan on 10/11/2019.
//  Copyright © 2019 Rael San Juan. All rights reserved.
//

import Foundation
import RSJ
import Astral

public final class PokedexListCoordinator: AbstractCoordinator {
    
    // MARK: Initializer
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        super.init()
    }
    
    // MARK: Stored Properties
    private unowned let navigationController: UINavigationController
    private let service: PokedexListService = PokedexListService()
    
    // MARK: Instance Methods
    public override func start() {
        super.start()
        self.navigationController.navigationBar.barTintColor = Colors.red
        let csvPath: String? = Bundle.main.path(forResource: "pokemon", ofType: "csv")
        
        do {
            let rawCSV: RawCSV = try RawCSV(filePath: csvPath)
            let pokemons: [PokemonData] = rawCSV.rows.map { PokemonData(dict: $0) }
            
            let vc: PokedexListVC = PokedexListVC(delegate: self, pokemons: pokemons)
            self.navigationController.viewControllers = [vc]
            
            
        } catch let error {
            let alert: UIAlertController = UIAlertController(
                title: "Error",
                message: error.localizedDescription,
                preferredStyle: UIAlertController.Style.alert
            )
            
            self.navigationController.present(alert, animated: true)
        }
    }
}

// MARK: PokedexListVCDelegate Methods
extension PokedexListCoordinator: PokedexListVCDelegate {
    public func pokemonCellTapped(_ pokemon: PokemonData, onComplete: @escaping () -> Void) {
        self.service.getDetailData(with: pokemon)
            .onSuccess(DispatchQueue.main.context) { [weak self] (models: DetailModels) -> Void in
                guard let s = self else { return }
                let coordinator: DetailCoordinator = DetailCoordinator(
                    delegate: s,
                    navigationController: s.navigationController,
                    models: models
                )
                
                s.add(childCoordinator: coordinator)
                coordinator.start()
            }
            .onFailure(NetworkQueue.context) { (error: NetworkingError) -> Void in
                print("Error: \(error.localizedDescription)")
            }
            .onComplete { (_) -> Void in
                onComplete()
            }
    }
}

extension PokedexListCoordinator: DetailCoordinatorDelegate {
    public func coordinatorDidDismissView(_ coordinator: DetailCoordinator) {
        self.remove(childCoordinator: coordinator)
        self.navigationController.navigationBar.barTintColor = Colors.red
    }
}
