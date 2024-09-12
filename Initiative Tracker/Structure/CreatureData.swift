//
//  Creature.swift
//  Initiative Tracker
//
//  Created by Dev Conch on 2024-08-26.
//

import SwiftUI

struct CreatureData: Decodable, Hashable {
    var name: String
    var type: String
    var speed: String
    var armorClass: Int
    var hpDefault: Int
    var hpDie: Int
    var hpCount: Int
    var hpAdd: Int
    var STR: Int
    var DEX: Int
    var CON: Int
    var WIS: Int
    var INT: Int
    var CHA: Int
    var stats: String
    var text: String
    
}

struct CreatureResponse: Decodable {
    let request: [CreatureData]
}

struct MockData {
    
    static let sampleCreature = CreatureData(name: "Grelph", type: "Tiny Humanoid, Chaotic Silly", speed: "40 ft.", armorClass: 19, hpDefault: 100, hpDie: 10, hpCount: 10, hpAdd: 50, STR: 10, DEX: 19, CON: 4, WIS: 22, INT: 1, CHA: 10, stats: "EATS PEOPLE", text: "EAT: Attack and eat someone mhm")
    
    
    
}
