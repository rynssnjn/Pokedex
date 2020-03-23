//
//  PokemonData.swift
//  Pokedex
//
//  Created by Rael San Juan on 10/11/2019.
//  Copyright © 2019 Rael San Juan. All rights reserved.
//

import Foundation
import Kio

public struct PokemonData {
    
    // MARK: Intializer
    public init(dict: [String: Any]) {
        let dict: ReadOnlyDictionary<JSONKey, Any> = ReadOnlyDictionary<JSONKey, Any>(dict)
        
        self.id = dict[JSONKey.id] as! String
        self.name = dict[JSONKey.identifier] as! String
        self.height = Int(dict[JSONKey.height] as! String)!
        self.weight = Int(dict[JSONKey.weight] as! String)!
        
    }
    
    // MARK: Stored Properties
    public let id: String
    public let name: String
    public let height: Int
    public let weight: Int
    
}

// MARK: - Equatable Protocol
extension PokemonData: Equatable {
    public static func == (lhs: PokemonData, rhs: PokemonData) -> Bool {
        return lhs.id == rhs.id &&
            lhs.name == rhs.name &&
            lhs.height == rhs.height &&
            lhs.weight == rhs.weight
    }
}

// MARK: - CustomStringConvertible Protocol
extension PokemonData: CustomStringConvertible {
    
    public var description: String {
        return "id: \(self.id), name: \(self.name), height: \(self.height), weight: \(self.weight)"
    }
}
