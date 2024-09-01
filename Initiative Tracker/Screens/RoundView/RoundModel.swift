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
    @Published var activeCreatureID: UUID = UUID()
    
    func beginCombat() {
        if realList.count == 0 { return }
        combatActive = true
        for creature in realList {
            creature.rerollInit()
        }
        activeCreatureID = realList.sorted{ $0.initiative > $1.initiative}[0].id
    }
    
    func endCombat(){
        combatActive = false
        activeCreatureID = UUID()
        realList = []
    }
    
    func advanceTurn() {
        var tick: Bool = false
        for (index, creature) in realList.sorted(by: { $0.initiative > $1.initiative}).enumerated() {

            if tick {
                activeCreatureID = creature.id
                break
            }
            if creature.id == activeCreatureID {
                tick.toggle()
            }
            if tick && index == realList.sorted(by: { $0.initiative > $1.initiative}).count-1 {
                activeCreatureID = realList.sorted{ $0.initiative > $1.initiative}[0].id
                roundCount+=1
                break
            }
            
        }
    }
    
    func deleteCreature(indexSet:IndexSet) {
        
        let temp = realList.sorted(by:{ $0.initiative > $1.initiative})[indexSet.first!].id
        
        if let _ = selectedList.firstIndex(of:temp) {
            selectedList.remove(atOffsets: [selectedList.firstIndex(of: temp)!])
        }
        
        if temp == activeCreatureID { advanceTurn() }
        
        for (index, creature) in realList.enumerated() {
            if creature.id == temp {
                realList.remove(at:index)
            }
        }
        
        if realList.count == 0 {endCombat()}
        
        
    }
    
}
