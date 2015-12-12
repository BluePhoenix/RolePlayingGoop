//
//  Character.swift
//  RolePlayingGoop
//
//  Created by Felix Barros on 12/12/15.
//  Copyright © 2015 Bits That Matter. All rights reserved.
//

import Foundation

class Character {
    private var _name: String = "Character"
    private var _healthPoints: Int = 100
    private var _attackPower: Int = 10
    
    var attackPower: Int {
        get {
            return _attackPower
        }
    }
    
    var healthPoints: Int {
        get {
            return _healthPoints
        }
    }
    
    var isAlive: Bool {
        get {
            return (healthPoints > 0)
        }
    }
    
    var name: String {
        get {
            return _name
        }
    }
    
    init(startingHealthPoints: Int, startingAttackPower: Int) {
        self._healthPoints = startingHealthPoints
        self._attackPower = startingAttackPower
    }
    
    func attemptAttack(attackPower: Int) -> Bool {
        self._healthPoints -= attackPower
        return true
    }
}
