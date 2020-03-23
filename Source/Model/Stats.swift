//
//  Stats.swift
//  Pokedex
//
//  Created by Rael San Juan on 10/11/2019.
//  Copyright © 2019 Rael San Juan. All rights reserved.
//

import Foundation

public struct Stats: Decodable {
    
    public init(from decoder: Decoder) throws {
        let arrayContainer: SingleValueDecodingContainer = try decoder.singleValueContainer()
        let statArray: [Stat] = try arrayContainer.decode([Stat].self)
        
        self.speed = statArray[StatIdentifier.speed.rawValue].baseStat
        self.specialDefense = statArray[StatIdentifier.specialDefense.rawValue].baseStat
        self.specialAttack = statArray[StatIdentifier.specialAttack.rawValue].baseStat
        self.defense = statArray[StatIdentifier.defense.rawValue].baseStat
        self.attack = statArray[StatIdentifier.attack.rawValue].baseStat
        self.hitPoints = statArray[StatIdentifier.hitPoints.rawValue].baseStat
    }
    
    public init(from statArray: [Stat]) {
        self.speed = statArray[StatIdentifier.speed.rawValue].baseStat
        self.specialDefense = statArray[StatIdentifier.specialDefense.rawValue].baseStat
        self.specialAttack = statArray[StatIdentifier.specialAttack.rawValue].baseStat
        self.defense = statArray[StatIdentifier.defense.rawValue].baseStat
        self.attack = statArray[StatIdentifier.attack.rawValue].baseStat
        self.hitPoints = statArray[StatIdentifier.hitPoints.rawValue].baseStat
    }
    
    // MARK: Stored Properties
    public let hitPoints: Int
    public let attack: Int
    public let defense: Int
    public let specialAttack: Int
    public let specialDefense: Int
    public let speed: Int
    
}
