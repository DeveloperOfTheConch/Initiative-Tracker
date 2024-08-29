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

    
    @State var selected: [UUID] = []
    
    var body: some View {
        Text("Round View")
        
        List() {
            ForEach(realList) { creature in
                
                
                
                HStack {
                    Text(creature.data.name)
                        .font(.title)
                    Text("HP: \(creature.health)")
                    
                    Spacer()
                    
                    Button {
                        print(creature.id)
                        
                    } label: {
                        Image(systemName:"chevron.down")

                    }
                    .buttonStyle(BorderlessButtonStyle())
                    .padding()

                }
                .padding(10)
                
                
            }
        }
        .listStyle(.plain)
        
        
        Button {
            selector = 3
            realList.append(Creature(data: MockData.sampleTarrasque))
        } label: {
            Text("Next")
        }
    }
}

#Preview {
    RoundView(selector:.constant(2))
}
