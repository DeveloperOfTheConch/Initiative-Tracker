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
            ForEach(MockList.sampleList) { creature in
                
                var isExpanded: Bool {
                    return selected.contains(creature.id)
                }
                
                
                
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
                        }
                            
                        
                        VStack {
                            Text(creature.data.name)
                                .font(.title)
                                .frame(width:250,height:30)

                            HStack {
                                Text("HP: \(creature.health)")
                            }
                        }
                        
                        Spacer()
                        
                        Button {
                            isExpanded ? selected.remove(atOffsets: [selected.firstIndex(of: creature.id)!]) : selected.append(creature.id)
                        } label: {
                            Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
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
