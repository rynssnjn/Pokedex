//
//  FlavorText.swift
//  Pokedex
//
//  Created by Rael San Juan on 10/11/2019.
//  Copyright © 2019 Rael San Juan. All rights reserved.
//

import Foundation

public struct FlavorText: Decodable {
    
    // MARK: CodingKey Enum
    public enum CodingKeys: String, CodingKey {
        case flavorText = "flavor_text"
        case language
        case name
        case version
    }
    
    // MARK: Initializer
    public init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer<FlavorText.CodingKeys> = try decoder.container(
            keyedBy: FlavorText.CodingKeys.self
        )
        
        let versionNode: KeyedDecodingContainer<FlavorText.CodingKeys> = try container.nestedContainer(
            keyedBy: FlavorText.CodingKeys.self, forKey: FlavorText.CodingKeys.version
        )
        
        self.version = try versionNode.decode(String.self, forKey: FlavorText.CodingKeys.name)
        
        let languageNode: KeyedDecodingContainer<FlavorText.CodingKeys> = try container.nestedContainer(
            keyedBy: FlavorText.CodingKeys.self, forKey: FlavorText.CodingKeys.language
        )
        
        self.language = try languageNode.decode(String.self, forKey: FlavorText.CodingKeys.name)
        
        self.text = try container.decode(String.self, forKey: FlavorText.CodingKeys.flavorText)
        
    }
    
    // MARK: Stored Properties
    public let text: String
    public let language: String
    public let version: String
    
}

// MARK: Equatable Function
extension FlavorText: Equatable {
    
    public static func == (lhs: FlavorText, rhs: FlavorText) -> Bool {
        return lhs.text == rhs.text &&
            lhs.language == rhs.language &&
            lhs.version == rhs.version
    }
    
}
