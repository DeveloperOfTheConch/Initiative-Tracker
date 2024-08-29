//
//  Creature.swift
//  Initiative Tracker
//
//  Created by Dev Conch on 2024-08-29.
//

import SwiftUI
import Foundation


class Creature: Identifiable {
    var data: CreatureData
    var id = UUID()
    var initiative: Int
    var health: Int
    var armorClass: Int
    var str: Int
    var dex: Int
    var con: Int
    var int: Int
    var wis: Int
    var cha: Int
    var number: Int?
    
    
    init(data: CreatureData) {
        self.data = data
        self.initiative = Int.random(in:1...20)+((Int(data.DEX)! - 10)/2)
        self.health = 100
        self.armorClass = Int(data.Armor_Class.prefix(2))!
        self.str = Int(data.STR)!
        self.dex = Int(data.DEX)!
        self.con = Int(data.CON)!
        self.int = Int(data.INT)!
        self.wis = Int(data.WIS)!
        self.cha = Int(data.CHA)!
        //var number: Int?
    }
    

}

struct MockList {
    static let sampleList = [Creature(data: MockData.sampleCreature),Creature(data: MockData.sampleCreature),Creature(data: MockData.sampleTarrasque),Creature(data: MockData.sampleCreature)]
}
