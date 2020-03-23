//
//  JSONKey.swift
//  Pokedex
//
//  Created by Rael San Juan on 10/11/2019.
//  Copyright © 2019 Rael San Juan. All rights reserved.
//

import Foundation

public enum JSONKey: String {
    case identifier

    case id
    case stats
    case forms
    case types
    case type
    case name
    case baseStat = "base_stat"
    case weight
    case height

    case flavorTexts = "flavor_text_entries"
    case flavorText = "flavor_text"
    case version
    case language

    case chain
    case evolutionDetails = "evolution_details"
    case evolvesTo = "evolves_to"
    case species

    case evolutionChain = "evolution_chain"
    case url
    case trigger
}
