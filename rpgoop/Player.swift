//
//  Player.swift
//  rpgoop
//
//  Created by Jonatan Knudsen on 01/01/2016.
//  Copyright © 2016 Jonatan Knudsen. All rights reserved.
//

import Foundation

class Player: Character {
    private var _name = "Player"
    
    var name: String {
        get {
            return _name
        }
    }
    
    private var _inventory = [String]()
    
    var inventory: [String] {
        get {
            return _inventory
        }
    }
    
    
    func addToInventory(item: String) {
        _inventory.append(item)
    }
    
    convenience init(name: String, hp: Int, attackPwr: Int) {
        self.init(hp: hp, attackPwr: attackPwr)
        _name = name
    }
}