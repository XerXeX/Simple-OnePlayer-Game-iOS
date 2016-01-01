//
//  Kimara.swift
//  rpgoop
//
//  Created by Jonatan Knudsen on 01/01/2016.
//  Copyright © 2016 Jonatan Knudsen. All rights reserved.
//

import Foundation

class Kimara: Enemy {
    let IMUNE_MAX = 15
    override var loot: [String] {
        return ["Tough Hide","Kimara Venom","Rare Trident"]
    }
    
    override var type: String {
        return "Kimara"
    }
    
    override func attemptAttack(attackPwr: Int) -> Bool {
        if attackPwr >= IMUNE_MAX {
            return super.attemptAttack(attackPwr)
        } else {
            return false
        }
    }
}