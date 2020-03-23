//
//  StatsViewModel.swift
//  Pokedex
//
//  Created by Rael San Juan on 10/11/2019.
//  Copyright © 2019 Rael San Juan. All rights reserved.
//

import UIKit
import Kio

public struct StatsViewModel {
    
    // MARK: Stored Properties
    public let stats: Stats
    
    // MARK: Computed Properties
    public var hpValue: CGFloat {
        return self.stats.hitPoints.kio.cgFloatValue
    }
    
    public var atkValue: CGFloat {
        return self.stats.attack.kio.cgFloatValue
    }
    
    public var defValue: CGFloat {
        return self.stats.defense.kio.cgFloatValue
    }
    
    public var spAtkValue: CGFloat {
        return self.stats.specialAttack.kio.cgFloatValue
    }
    
    public var spDefValue: CGFloat {
        return self.stats.specialDefense.kio.cgFloatValue
    }
    
    public var spdValue: CGFloat {
        return self.stats.speed.kio.cgFloatValue
    }
    
    public var hp: String {
        return "\(self.stats.hitPoints)"
    }
    
    public var atk: String {
        return "\(self.stats.attack)"
    }
    
    public var def: String {
        return "\(self.stats.defense)"
    }
    
    public var spAtk: String {
        return "\(self.stats.specialAttack)"
    }
    
    public var spDef: String {
        return "\(self.stats.specialDefense)"
    }
    
    public var spd: String {
        return "\(self.stats.speed)"
    }
    
    public var statValues: [CGFloat] {
        return [
            self.hpValue, self.atkValue,
            self.defValue, self.spAtkValue,
            self.spDefValue, self.spdValue
        ]
    }
    
}

