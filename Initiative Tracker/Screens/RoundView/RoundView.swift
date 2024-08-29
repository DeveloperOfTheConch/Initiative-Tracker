//
//  RoundView.swift
//  Initiative Tracker
//
//  Created by Dev Conch on 2024-08-26.
//

import SwiftUI

struct RoundView: View {
    
    @Binding var selector: Int
    
    @State var realList: [Creature] = []
    
    @State var selectedList: [UUID] = []
    
    var body: some View {
        Text("Round View")
        
        List() {
            ForEach(MockList.sampleList) { creature in
                CreatureSimpleCell(creature: creature, selectedList: $selectedList)
            }
        }
        .listStyle(.plain)
        
        HStack{
            Button {
                realList.append(Creature(data:MockData.sampleCreature))
            } label: {
                Text("Add 1")
            }
            
            Button {
                realList.append(Creature(data:MockData.sampleTarrasque))
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
