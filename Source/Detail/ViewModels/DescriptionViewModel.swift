//
//  DescriptionViewModel.swift
//  Pokedex
//
//  Created by Rael San Juan on 10/11/2019.
//  Copyright © 2019 Rael San Juan. All rights reserved.
//

import UIKit

public struct DescriptionViewModel {
    
    // MARK: Stored Properties
    public let pokemon: Pokemon
    public let species: Species
    public let evolution: Evolution
    
    // MARK: Computed Properties
    public var image: UIImage? {
        return UIImage(named: "\(self.pokemon.id)")
    }
    
    public var id: String {
        if self.pokemon.id < 10 {
            
            return "00\(self.pokemon.id)"
            
        } else if self.pokemon.id < 100 {
            
            return "0\(self.pokemon.id)"
            
        } else {
            
            return "\(self.pokemon.id)"
            
        }
    }
    
    public var name: String {
        return self.pokemon.name.capitalized
    }
    
    public var height: String {
        let heightInMeters: Double = Double(self.pokemon.height) / 10.0
        return "\(heightInMeters) m"
    }
    
    public var weight: String {
        let weightInKg: Double = Double(self.pokemon.weight) / 10.0
        return "\(weightInKg) kg"
    }
    
    public var types: String {
        switch self.pokemon.types.secondaryType.isEmpty {
        case true:
            return self.pokemon.types.primaryType.capitalized
            
        case false:
            return "\(self.pokemon.types.primaryType.capitalized)/\(self.pokemon.types.secondaryType.capitalized)"
        }
    }
    
    public var color: UIColor {
        return PokemonType(rawValue: self.pokemon.types.primaryType)!.color
    }
    
    public var text: String {
        return self.species.text
    }
    
    public var evolutionImages: [UIImage?] {
        return self.evolution.nodes.map { UIImage(named: "\($0.id)")}
    }
    
}

public extension DescriptionViewModel {
    
    init(models: DetailModels) {
        self.pokemon = models.pokemon
        self.evolution = models.evolution
        self.species = models.species
    }
    
}

