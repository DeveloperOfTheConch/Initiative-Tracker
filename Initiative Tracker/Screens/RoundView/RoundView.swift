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
                
                CreatureSimpleCell(creature: creature, selectedList: $vm.selectedList)
                
                if vm.selectedList.contains(creature.id) {
                    CreatureComplexCell(creature:creature)
                        .listRowSeparator(.hidden, edges: .top)
                }
                
            }
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
        
        Button {
            selector = 3

        } label: {
            Text("Next")
        }
    }
}

#Preview {
    RoundView(selector:.constant(2))
}
