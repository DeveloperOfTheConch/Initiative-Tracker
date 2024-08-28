//
//  RoundView.swift
//  Initiative Tracker
//
//  Created by Dev Conch on 2024-08-26.
//

import SwiftUI

struct RoundView: View {
    
    @Binding var selector: Int
    
    @State var selected: [UUID] = []
    
    var body: some View {
        Text("Round View")
        
        List() {
            ForEach(MockData.sampleList) { creature in
                
                var isUp: Bool {
                    if selected.firstIndex(of: creature.id) != nil {
                        return true
                    }
                    return false
                }
                
                HStack {
                    Text(creature.name)
                        .font(.title)
                    Text("HP: " + creature.Hit_Points.prefix(3))
                    
                    Spacer()
                    
                    Button {
                        let temp = creature.id
                        isUp ? print(selected.firstIndex(of: temp)!) : selected.append(temp)
                        print(selected)
                    } label: {
                        Image(systemName:"chevron.down")

                    }
                    .buttonStyle(BorderlessButtonStyle())
                    .padding()

                }
                .padding(10)
                
                if isUp {
                    Text("HELLO WORLD")
                }
            }
        }
        .listStyle(.plain)
        
        
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
