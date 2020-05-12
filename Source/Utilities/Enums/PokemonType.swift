//
//  PokemonType.swift
//  Pokedex
//
//  Created by Rael San Juan on 10/11/2019.
//  Copyright © 2019 Rael San Juan. All rights reserved.
//

import UIKit

public enum PokemonType: String {
    
    case normal
    case fire
    case fighting
    case water
    case flying
    case grass
    case poison
    case electric
    case ground
    case psychic
    case rock
    case ice
    case bug
    case dragon
    case ghost
    case dark
    case steel
    case fairy
    
    public var color: UIColor {
        switch self {
        case .normal:
            return UIColor.rsj.color(red: 168, green: 168, blue: 120)
            
        case .fire:
            return UIColor.rsj.color(red: 240, green: 128, blue: 48)
            
        case .fighting:
            return UIColor.rsj.color(red: 192, green: 48, blue: 40)
            
        case .water:
            return UIColor.rsj.color(red: 104, green: 144, blue: 240)
            
        case .flying:
            return UIColor.rsj.color(red: 168, green: 144, blue: 240)
            
        case .grass:
            return UIColor.rsj.color(red: 122, green: 199, blue: 76)
            
        case .poison:
            return UIColor.rsj.color(red: 160, green: 64, blue: 160)
            
        case .electric:
            return UIColor.rsj.color(red: 248, green: 208, blue: 48)
            
        case .ground:
            return UIColor.rsj.color(red: 224, green: 192, blue: 104)
            
        case .psychic:
            return UIColor.rsj.color(red: 248, green: 88, blue: 136)
            
        case .rock:
            return UIColor.rsj.color(red: 184, green: 160, blue: 56)
            
        case .ice:
            return UIColor.rsj.color(red: 152, green: 216, blue: 216)
            
        case .bug:
            return UIColor.rsj.color(red: 168, green: 184, blue: 32)
            
        case .dragon:
            return UIColor.rsj.color(red: 112, green: 56, blue: 248)
            
        case .ghost:
            return UIColor.rsj.color(red: 112, green: 88, blue: 152)
            
        case .dark:
            return UIColor.rsj.color(red: 112, green: 88, blue: 72)
            
        case .steel:
            return UIColor.rsj.color(red: 184, green: 184, blue: 208)
            
        case .fairy:
            return UIColor.rsj.color(red: 238, green: 153, blue: 172)
        }
    }
    
}
