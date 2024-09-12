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
    @Published var tempHP: Int = 0
    @Published var armorClass: Int
    @Published var number: Int?
    
    
    
    init(data: CreatureData) {
        self.data = data
        self.initiative = Int.random(in:1...20)
        

        var dic: Int = 0
        for _ in 0..<data.hpDie {
            dic+=Int.random(in:1...data.hpCount)
        }
        self.health = dic + data.hpAdd
        self.armorClass = data.armorClass
        //var number: Int?
    }
    
    
    func rerollInit() {
        initiative = Int.random(in:1...20)
    }
    
    func rerollHP() {
        var dic: Int = 0
        for _ in 0..<data.hpDie {
            dic+=Int.random(in:1...data.hpCount)
        }
        self.health = dic + data.hpAdd
    }
    
    func rerollAll() {
        rerollInit()
        rerollHP()
    }

}

struct MockList {
    static let sampleList = [Creature(data: MockData.sampleCreature),Creature(data: MockData.sampleCreature),Creature(data: MockData.sampleCreature)]
}
