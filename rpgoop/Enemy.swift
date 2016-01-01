//
//  Enemy.swift
//  rpgoop
//
//  Created by Jonatan Knudsen on 01/01/2016.
//  Copyright © 2016 Jonatan Knudsen. All rights reserved.
//

import Foundation

class Enemy: Character {
    var loot: [String] {
        return ["Rusty Dagger","Cracked Buckler"]
    }
    
    var type: String {
        return "Grunt"
    }
    
    func dropLoot() -> String? {
        if !isAlive {
            let rand = Int(arc4random_uniform(UInt32(loot.count)))
            return loot[rand]
        }
        return nil
    }
}