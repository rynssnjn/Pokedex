//
//  Stat.swift
//  Pokedex
//
//  Created by Rael San Juan on 10/11/2019.
//  Copyright © 2019 Rael San Juan. All rights reserved.
//

import Foundation

public struct Stat: Decodable {
    
    // MARK: CodingKeys Enum
    public enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case name
        case stat
    }
    
    // MARK: Initializer
    public init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer<Stat.CodingKeys> = try decoder.container(keyedBy: Stat.CodingKeys.self)
        
        let statContainer: KeyedDecodingContainer<Stat.CodingKeys> = try container.nestedContainer(
            keyedBy: Stat.CodingKeys.self, forKey: Stat.CodingKeys.stat
        )
        
        self.name = try statContainer.decode(String.self, forKey: Stat.CodingKeys.name)
        self.baseStat = try container.decode(Int.self, forKey: Stat.CodingKeys.baseStat)
        
    }
    
    // MARK: Stored Properties
    public let name: String
    public let baseStat: Int
}
