//
//  Creature.swift
//  Initiative Tracker
//
//  Created by Dev Conch on 2024-08-29.
//

import SwiftUI
import Foundation


class Creature: Identifiable, ObservableObject {
    let data: CreatureData
    let id = UUID()
    @Published var initiative: Int
    @Published var health: Int
    @Published var armorClass: Int
    @Published var str: Int
    @Published var dex: Int
    @Published var con: Int
    @Published var int: Int
    @Published var wis: Int
    @Published var cha: Int
    @Published var number: Int?
    
    
    init(data: CreatureData) {
        self.data = data
        self.initiative = Int.random(in:1...20)+((Int(data.DEX)! - 10)/2)
        
        let lb = data.Hit_Points.range(of: "(")!
        let rb = data.Hit_Points.range(of: ")")!
        let pl = data.Hit_Points.range(of: " + ")!
        let d = data.Hit_Points.range(of: "d")!
        let num = Int(data.Hit_Points[lb.upperBound..<d.lowerBound])!
        let die = Int(data.Hit_Points[d.upperBound..<pl.lowerBound])!
        let add = Int(data.Hit_Points[pl.upperBound..<rb.lowerBound])!
        var dic: Int = 0
        for _ in 0..<num {
            dic+=Int.random(in:1...die)
        }
        self.health = dic + add
        self.armorClass = Int(data.Armor_Class.prefix(2))!
        self.str = Int(data.STR)!
        self.dex = Int(data.DEX)!
        self.con = Int(data.CON)!
        self.int = Int(data.INT)!
        self.wis = Int(data.WIS)!
        self.cha = Int(data.CHA)!
        //var number: Int?
    }
    
    
    func rerollInit() {
        initiative = Int.random(in:1...20)+((Int(data.DEX)! - 10)/2)
    }
    
    func rerollHP() {
        let lb = data.Hit_Points.range(of: "(")!
        let rb = data.Hit_Points.range(of: ")")!
        let pl = data.Hit_Points.range(of: " + ")!
        let d = data.Hit_Points.range(of: "d")!
        let num = Int(data.Hit_Points[lb.upperBound..<d.lowerBound])!
        let die = Int(data.Hit_Points[d.upperBound..<pl.lowerBound])!
        let add = Int(data.Hit_Points[pl.upperBound..<rb.lowerBound])!
        var dic: Int = 0
        for _ in 0..<num {
            dic+=Int.random(in:1...die)
        }
        self.health = dic + add
    }
    
    func rerollAll() {
        rerollInit()
        rerollHP()
    }

}

struct MockList {
    static let sampleList = [Creature(data: MockData.sampleCreature),Creature(data: MockData.sampleCreature),Creature(data: MockData.sampleTarrasque),Creature(data: MockData.sampleCreature)]
}
