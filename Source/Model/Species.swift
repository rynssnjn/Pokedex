//
//  Species.swift
//  Pokedex
//
//  Created by Rael San Juan on 10/11/2019.
//  Copyright © 2019 Rael San Juan. All rights reserved.
//

import Foundation

public struct Species: Decodable {
    
    // MARK: CodingKey Enum
    public enum CodingKeys: String, CodingKey {
        case flavorTexts = "flavor_text_entries"
        case chain = "evolution_chain"
        case url
    }
    
    // MARK: Initializer
    public init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer<Species.CodingKeys> = try decoder.container(keyedBy: Species.CodingKeys.self)
        
        let flavorTexts: [FlavorText] = try container.decode([FlavorText].self, forKey: Species.CodingKeys.flavorTexts)
        
        let filteredTexts: [FlavorText] = flavorTexts.filter {
            return $0.version == "alpha-sapphire" && $0.language == "en"
        }
        
        guard let flavorText = filteredTexts.first else { fatalError("No flavor text") }
        
        let chainNode: KeyedDecodingContainer<Species.CodingKeys> = try container.nestedContainer(
            keyedBy: Species.CodingKeys.self,
            forKey: Species.CodingKeys.chain
        )
        self.text = flavorText.text
        self.evolutionURL = try chainNode.decode(URL.self, forKey: Species.CodingKeys.url)
    }
    
    // MARK: Stored Properties
    public let text: String
    public let evolutionURL: URL
    
}
