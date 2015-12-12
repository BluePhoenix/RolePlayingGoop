//
//  Player.swift
//  RolePlayingGoop
//
//  Created by Felix Barros on 12/12/15.
//  Copyright © 2015 Bits That Matter. All rights reserved.
//

import Foundation

class Player: Character {
    private var _name = "Player"
    
    private var _inventory = [String]()
    
    var inventory: [String] {
        return _inventory
    }
    
    convenience init(name: String, startingHealthPoints: Int, startingAttackPower: Int) {
        self.init(startingHealthPoints: startingHealthPoints, startingAttackPower: startingAttackPower)
    }
}
