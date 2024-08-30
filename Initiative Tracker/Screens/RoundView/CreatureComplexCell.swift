//
//  SwiftUIView.swift
//  Initiative Tracker
//
//  Created by Dev Conch on 2024-08-29.
//

import SwiftUI

struct CreatureComplexCell: View {
    
    var creature: Creature
    
    var body: some View {
        Text(creature.data.Traits)
    }
}

#Preview {
    List(){
        ForEach(MockList.sampleList) { creature in
            CreatureComplexCell(creature:creature)
            
        }
    }
    .listStyle(.plain)
}
