//
//  RoundView.swift
//  Initiative Tracker
//
//  Created by Dev Conch on 2024-08-26.
//

import SwiftUI

struct RoundView: View {
    
    @Binding var selector: Int
    
    @StateObject var vm = RoundModel()
    
    var body: some View {
        Text("Round View")
        
        List() {
            ForEach(vm.realList.sorted{ $0.initiative > $1.initiative}) { creature in
                
                CreatureSimpleCell(creature: creature, selectedList: $vm.selectedList,activeID:vm.activeCreature)
                
                if vm.selectedList.contains(creature.id) {
                    CreatureComplexCell(creature:creature)
                        .listRowSeparator(.hidden, edges: .top)
                }
                
            }
            .onDelete(perform: { indexSet in
                let temp = vm.realList.sorted(by:{ $0.initiative > $1.initiative})[indexSet.first!]
                print(temp)
                /// so what do we have here
                /// we have an indexSet of the value in

            })
        }
        .listStyle(.plain)
        
        HStack{
            Button {
                vm.realList.append(Creature(data:MockData.sampleCreature))
            } label: {
                Text("Add 1")
            }
            
            Button {
                vm.realList.append(Creature(data:MockData.sampleTarrasque))
            } label: {
                Text("Add 2")
            }
        }
        
        HStack {
            Button {
                selector = 1

            } label: {
                Text("Combats")
            }
            Button {
                vm.combatActive ? vm.advanceTurn() : vm.beginCombat()

            } label: {
                Text(vm.combatActive ? "Next" : "Roll")
            }
            Button {
                selector = 3

            } label: {
                Text("Creatures")
            }
        }
    }
}

#Preview {
    RoundView(selector:.constant(2))
}
