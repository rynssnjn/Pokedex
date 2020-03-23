//
//  PokemonDataViewModel.swift
//  Pokedex
//
//  Created by Rael San Juan on 10/11/2019.
//  Copyright © 2019 Rael San Juan. All rights reserved.
//

import UIKit

public struct PokemonDataViewModel: Equatable {
    
    // MARK: Stored Properties
    public let model: PokemonData
    
    // MARK: Computed Properties
    public var name: String {
        return self.model.name.uppercased()
    }
    
    public var height: String {
        let heightInMeters: Double = self.model.height.kio.doubleValue / 10.0
        return "\(heightInMeters) m"
    }
    
    public var weight: String {
        let weightInKilograms: Double = self.model.weight.kio.doubleValue / 10.0
        return "\(weightInKilograms) kg"
    }
    
    public var image: UIImage? {
        return UIImage(named: self.model.id)
    }
    
}
