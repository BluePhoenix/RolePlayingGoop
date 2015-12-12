//
//  Kimara.swift
//  RolePlayingGoop
//
//  Created by Felix Barros on 12/12/15.
//  Copyright © 2015 Bits That Matter. All rights reserved.
//

import Foundation

class Kimara: Enemy {
    let maxImmunity = 15
    
    override var loot: [String] {
        return ["Tough Hide", "Kimara Venom", "Rare Trident"]
    }
    
    override var type: String {
        return "Kimara"
    }
    
    override func attemptAttack(attackPower: Int) -> Bool {
        if attackPower >= maxImmunity {
            return super.attemptAttack(attackPower)
        } else {
            return false
        }
    }
}
