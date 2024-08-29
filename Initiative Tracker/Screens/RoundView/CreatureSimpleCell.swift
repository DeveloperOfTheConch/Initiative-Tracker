//
//  CreatureSimpleCell.swift
//  Initiative Tracker
//
//  Created by Dev Conch on 2024-08-29.
//

import SwiftUI

struct CreatureSimpleCell: View {
    
    var creature: Creature
    @Binding var selectedList: [UUID]
    
    var body: some View {
        
        VStack {
            HStack {
                
                ZStack {
                    Image(systemName:"hexagon")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:50,height:50)
                    
                    Text("\(creature.initiative)")
                        .font(.title3)
                        .bold()
                        .onLongPressGesture {
                            print("CHANGE INITIATIVE")
                            creature.initiative = 21
                        }
                }
                    
                
                VStack {
                    Text(creature.data.name)
                        .font(.title)
                        .frame(width:250,height:30)

                    HStack {
                        Text("AC: \(creature.armorClass)")
                        Text("HP: \(creature.health)")
                    }
                }
                
                Spacer()
                
                Button {
                    selectedList.contains(creature.id) ? selectedList.remove(atOffsets: [selectedList.firstIndex(of: creature.id)!]) : selectedList.append(creature.id)
                } label: {
                    Image(systemName: selectedList.contains(creature.id) ? "chevron.up" : "chevron.down")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:20)
                        .tint(.primary)

                }
                .buttonStyle(BorderlessButtonStyle())
                .padding()

            }
        }
    
        
        
        
        
    }
}

#Preview {
    List(){
        ForEach(MockList.sampleList) { creature in
            CreatureSimpleCell(creature:creature,selectedList:.constant([]))
            
        }
    }
    .listStyle(.plain)

}
