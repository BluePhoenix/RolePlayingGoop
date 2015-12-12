//
//  Enemy.swift
//  RolePlayingGoop
//
//  Created by Felix Barros on 12/12/15.
//  Copyright © 2015 Bits That Matter. All rights reserved.
//

import Foundation

class Enemy: Character {
    var loot: [String] {
        return ["Rusty Dagger", "Cracked Buckler"]
    }
    
    var type: String {
        return "Grunt"
    }
    
    func dropLoot() -> String? {
        if !self.isAlive {
            // On enemy death, calculate drop
            let randomNumber = Int(arc4random_uniform(UInt32(loot.count)))
            return loot[randomNumber]
        }
        
        return nil
    }
}
