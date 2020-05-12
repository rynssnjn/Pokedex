//
//  StatsViewModel.swift
//  Pokedex
//
//  Created by Rael San Juan on 10/11/2019.
//  Copyright © 2019 Rael San Juan. All rights reserved.
//

import UIKit

public struct StatsViewModel {
    
    // MARK: Stored Properties
    public let stats: Stats
    
    // MARK: Computed Properties
    public var hpValue: CGFloat {
        return self.stats.hitPoints.rsj.asCGFloat
    }
    
    public var atkValue: CGFloat {
        return self.stats.attack.rsj.asCGFloat
    }
    
    public var defValue: CGFloat {
        return self.stats.defense.rsj.asCGFloat
    }
    
    public var spAtkValue: CGFloat {
        return self.stats.specialAttack.rsj.asCGFloat
    }
    
    public var spDefValue: CGFloat {
        return self.stats.specialDefense.rsj.asCGFloat
    }
    
    public var spdValue: CGFloat {
        return self.stats.speed.rsj.asCGFloat
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

