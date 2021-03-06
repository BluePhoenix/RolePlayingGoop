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
    @IBOutlet weak var attackButton: UIButton!

    var player: Player!
    var enemy: Enemy!
    
    var dropMessage: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        player = Player(name: "Dirty Laundry", startingHealthPoints: 110, startingAttackPower: 20)
        updateHealthPoints()
        
        generateRandomEnemy()

    }

    @IBAction func attackButtonTapped(sender: AnyObject) {
        
        if !enemy.isAlive {
            // Only attack while enemy is alive
            return
        }
        
        if enemy.attemptAttack(player.attackPower) {
            printLabel.text = "Attacked \(enemy.type) for \(player.attackPower) HP"
        } else {
            printLabel.text = "Attack was unsuccessful"
        }
        
        if let loot = enemy.dropLoot() {
            player.addItemToInventory(loot)
            dropMessage = "\(player.name) found \(loot)"
            chestButton.hidden = false
        }
        
        updateHealthPoints()
        
        if !enemy.isAlive {
            enemyHealthPoints.text = ""
            printLabel.text = "Defeated \(enemy.type)"
            enemyImage.hidden = true
        }
    }
    
    @IBAction func chestTapped(sender: AnyObject) {
        chestButton.hidden = true
        printLabel.text = dropMessage
        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "generateRandomEnemy", userInfo: nil, repeats: false)
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
        enemyImage.hidden = false
        updateHealthPoints()
    }
    
    func updateHealthPoints() {
        if let player = self.player {
            playerHealthPoints.text = "\(player.healthPoints) HP"
        }

        if let enemy = self.enemy {
            enemyHealthPoints.text = "\(enemy.healthPoints) HP"
        }
    }

}

