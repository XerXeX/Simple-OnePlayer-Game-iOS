//
//  ViewController.swift
//  rpgoop
//
//  Created by Jonatan Knudsen on 01/01/2016.
//  Copyright © 2016 Jonatan Knudsen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var printLbl: UILabel!
    
    @IBOutlet weak var playerHpLbl: UILabel!
    
    @IBOutlet weak var EnemyHpLbl: UILabel!
    
    @IBOutlet weak var EnemyImg: UIImageView!
    
    @IBOutlet weak var chestBut: UIButton!
    
    var player: Player!
    var enemy: Enemy!
    var chestMassage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        player = Player(name: "XerXeX", hp: 200, attackPwr: 25)
        
        generateRandomEnemy()
        
        playerHpLbl.text = "\(player.hp) HP"
    }
    
    func generateRandomEnemy() {
        let rand = Int(arc4random_uniform(2))
        
        if rand == 0 {
            enemy = Kimara(hp: 150, attackPwr: 12)
        } else {
            enemy = DevilWizard(hp: 260, attackPwr: 15)
        }
        updateEnemyHp()
        EnemyImg.hidden = false
        print("Enemy of type \(enemy.type) was created")
    }
    
    func updateEnemyHp() {
        EnemyHpLbl.text = "\(enemy.hp) HP"
    }

    @IBAction func onChestPressed(sender: AnyObject) {
        chestBut.hidden = true
        printLbl.text = chestMassage
        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "generateRandomEnemy", userInfo: nil, repeats: false)
    }

    @IBAction func onAttackPressed(sender: AnyObject) {
        print("you are attackin a \(enemy.type)")
        
        
        if enemy.attemptAttack(player.attackPwr) {
            printLbl.text = "Attacked \(enemy.type) for \(player.attackPwr) HP"
            updateEnemyHp()
        } else {
            printLbl.text = "Attack was unsuccessful!"
        }
        
        if let loot = enemy.dropLoot() {
            player.addToInventory(loot)
            chestMassage = "\(player.name) found a \(loot)"
            chestBut.hidden = false
        }
        
        if !enemy.isAlive {
            EnemyHpLbl.text = ""
            printLbl.text = "You killed the \(enemy.type)"
            EnemyImg.hidden = true
        }
    }

}

