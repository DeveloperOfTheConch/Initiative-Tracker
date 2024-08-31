//
//  RoundModel.swift
//  Initiative Tracker
//
//  Created by Dev Conch on 2024-08-29.
//

import SwiftUI

final class RoundModel: ObservableObject {
    
    @Published var selectedList: [UUID] = []
    @Published var realList: [Creature] = MockList.sampleList
    
    @Published var combatActive: Bool = false
    @Published var roundCount: Int = 0
    @Published var activeCreature: UUID = UUID()
    
    func beginCombat() {
        combatActive = true
        for creature in realList {
            creature.rerollInit()
        }
        activeCreature = realList.sorted{ $0.initiative > $1.initiative}[0].id
    }
    
    func advanceTurn() {
        var tick: Bool = false
        for (index, creature) in realList.sorted(by: { $0.initiative > $1.initiative}).enumerated() {

            if tick {
                activeCreature = creature.id
                break
            }
            if creature.id == activeCreature {
                tick.toggle()
            }
            if tick && index == realList.sorted(by: { $0.initiative > $1.initiative}).count-1 {
                activeCreature = realList.sorted{ $0.initiative > $1.initiative}[0].id
                roundCount+=1
                break
            }
            
        }
    }
    
}
