//
//  CharacterExtensions.swift
//  Pokedex
//
//  Created by Rael San Juan on 10/11/2019.
//  Copyright © 2019 Rael San Juan. All rights reserved.
//

import Foundation

public extension Character {
    
    var isUpperCase: Bool { return String(self) == String(self).uppercased() }
    
}
