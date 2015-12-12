//
//  ViewController.swift
//  RolePlayingGoop
//
//  Created by Felix Barros on 12/12/15.
//  Copyright © 2015 Bits That Matter. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var printLabel: UILabel!
    @IBOutlet weak var playerHealthPoints: UILabel!
    @IBOutlet weak var enemyHealthPoints: UILabel!
    @IBOutlet weak var enemyImage: UIImageView!
    @IBOutlet weak var chestButton: UIButton!

    var player: Player!
    var enemy: Enemy!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        player = Player(name: "Dirty Laundry", startingHealthPoints: 110, startingAttackPower: 20)
        
        generateRandomEnemy()

        updateHealthPoints()
    }

    // MARK: Helper functions
    func generateRandomEnemy() {
        let randomNumber = Int(arc4random_uniform(UInt32(2)))
        
        switch randomNumber {
        case 1:
            enemy = Kimara(startingHealthPoints: 50, startingAttackPower: 12)
        default:
            enemy = FiendishWizard(startingHealthPoints: 60, startingAttackPower: 15)
        }
    }
    func updateHealthPoints() {
        playerHealthPoints.text = "\(player.healthPoints) HP"
    }

}

