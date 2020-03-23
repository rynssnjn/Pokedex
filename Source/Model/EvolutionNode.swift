//
//  EvolutionNode.swift
//  Pokedex
//
//  Created by Rael San Juan on 10/11/2019.
//  Copyright © 2019 Rael San Juan. All rights reserved.
//

import Foundation

public struct EvolutionNode: Decodable {
    
    // MARK: CodingKeys Enum
    public enum CodingKeys: String, CodingKey {
        case name
        case url
    }
    
    // MARK: Intitializers
    public init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer<EvolutionNode.CodingKeys> = try decoder.container(
            keyedBy: EvolutionNode.CodingKeys.self
        )
        
        let url: URL = try container.decode(URL.self, forKey: EvolutionNode.CodingKeys.url)
        self.id = Int(url.lastPathComponent)!
        self.name = try container.decode(String.self, forKey: EvolutionNode.CodingKeys.name)
        self.condition = ""
        self.value = ""
    }
    
    public init(id: Int, name: String, condition: String = "", value: String = "") {
        self.id = id
        self.name = name
        self.condition = condition
        self.value = value
    }
    
    // MARK: Stored Properties
    public let id: Int
    public let name: String
    public let condition: String
    public let value: String
}
