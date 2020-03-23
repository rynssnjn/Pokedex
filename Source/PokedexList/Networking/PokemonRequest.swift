//
//  PokemonRequest.swift
//  Pokedex
//
//  Created by Rael San Juan on 10/11/2019.
//  Copyright © 2019 Rael San Juan. All rights reserved.
//

import Foundation
import Astral

public struct PokemonRequest: Request {
    
    // MARK: Initializers
    public init(pokemonData: PokemonData) {
        self.pokemonData = pokemonData
    }
    
    // MARK: Stored Properties
    private let pokemonData: PokemonData
    
    // MARK: Computed Properties
    public var configuration: RequestConfiguration {
        return BaseConfiguration()
    }
    
    public var method: HTTPMethod {
        return HTTPMethod.get
    }
    
    public var pathComponents: [String] {
        return [
            "pokemon",
            "\(self.pokemonData.id)"
        ]
    }
    
    public var parameters: Parameters = Parameters.none
    
    public var headers: Set<Header> = []

    public var cachePolicy: URLRequest.CachePolicy? {
        return nil
    }
}
