//
//  Types.swift
//  Pokedex
//
//  Created by Rael San Juan on 10/11/2019.
//  Copyright © 2019 Rael San Juan. All rights reserved.
//

import Foundation

public struct Types: Decodable {
    
    // MARK: Intializers
    public init(from decoder: Decoder) throws {
        let arrayContainer: SingleValueDecodingContainer = try decoder.singleValueContainer()
        
        let typeArray: [Type] = try arrayContainer.decode([Type].self)
        
        switch typeArray.count == 2 {
        case true:
            self.primaryType = typeArray[1].name
            self.secondaryType = typeArray[0].name
            
        case false:
            self.primaryType = typeArray[0].name
        }
    }
    
    // MARK: Stored Properties
    public let primaryType: String
    public var secondaryType: String = ""
    
}
