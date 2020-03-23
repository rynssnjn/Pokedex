//
//  Type.swift
//  Pokedex
//
//  Created by Rael San Juan on 10/11/2019.
//  Copyright © 2019 Rael San Juan. All rights reserved.
//

import Foundation

public struct Type: Decodable {
    
    // MARK: CodingKey Enum
    public enum CodingKeys: String, CodingKey {
        case type
        case name
    }
    
    // MARK: Initializer
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Type.CodingKeys.self)
        let typeContainer = try container.nestedContainer(keyedBy: Type.CodingKeys.self, forKey: Type.CodingKeys.type)
        self.name = try typeContainer.decode(String.self, forKey: Type.CodingKeys.name)
    }
    
    // MARK: Stored Properties
    public let name: String
    
}
