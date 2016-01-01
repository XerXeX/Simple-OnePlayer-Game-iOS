//
//  DevilWizard.swift
//  rpgoop
//
//  Created by Jonatan Knudsen on 01/01/2016.
//  Copyright © 2016 Jonatan Knudsen. All rights reserved.
//

import Foundation

class DevilWizard: Enemy {
    override var loot: [String] {
        return ["Magic Want","Dark Amulet","Salted Pork"]
    }
    
    override var type: String {
        return "Devil Wizard"
    }
}