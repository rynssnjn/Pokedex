//
//  Pokemon.swift
//  Pokedex
//
//  Created by Rael San Juan on 10/11/2019.
//  Copyright © 2019 Rael San Juan. All rights reserved.
//

import Foundation

public struct Pokemon: Decodable {
    
    // MARK: CodingKey Enum
    public enum CodingKeys: String, CodingKey {
        case id
        case name
        case weight
        case height
        case forms
        case stats
        case types
    }
    
    public init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer<Pokemon.CodingKeys> = try decoder.container(
            keyedBy: Pokemon.CodingKeys.self
        )
        
        var formsNode: UnkeyedDecodingContainer = try container.nestedUnkeyedContainer(forKey: Pokemon.CodingKeys.forms)
        let formsDict: KeyedDecodingContainer<Pokemon.CodingKeys> = try formsNode.nestedContainer(
            keyedBy: Pokemon.CodingKeys.self
        )
        
        self.id = try container.decode(Int.self, forKey: Pokemon.CodingKeys.id)
        self.name = try formsDict.decode(String.self, forKey: Pokemon.CodingKeys.name)
        self.weight = try container.decode(Int.self, forKey: Pokemon.CodingKeys.weight)
        self.height = try container.decode(Int.self, forKey: Pokemon.CodingKeys.height)
        self.stats = try container.decode(Stats.self, forKey: Pokemon.CodingKeys.stats)
        self.types = try container.decode(Types.self, forKey: Pokemon.CodingKeys.types)
        
    }
    
    // MARK: Stored Properties
    public let id: Int
    public let name: String
    public let height: Int
    public let weight: Int
    public let types: Types
    public let stats: Stats
    
}
