//
//  TabView.swift
//  Initiative Tracker
//
//  Created by Dev Conch on 2024-08-26.
//

import SwiftUI

struct TabView: View {
    
    @State private var selector: Int = 2
    
    @State private var addButtonPressed: Bool = false
    
    private let tabNames = ["Combat View","Round View","Creature View"]
    
    var body: some View {
        
        VStack(spacing:0){
            
            HStack {
                
                Spacer()
                    .frame(width:15,height:1)
                
                Button{
                    
                } label: {
                    TopButton(imageName:"info.circle")
                }
                .padding(10)
                
                Spacer()
                
                Text("\(tabNames[selector-1])")
                    .font(.title)
                
                Spacer()
                
                Button{
                    addButtonPressed = true
                } label: {
                    TopButton(imageName:"plus")
                }
                .padding(10)
                
                Spacer()
                    .frame(width:15,height:1)
                
            }
            .background(.gray)
            
            Rectangle()
                .frame(height:5)
                .background(.black)
        }
    
        if selector == 1{
            CombatView(selector:$selector, showingAddMenu:$addButtonPressed)
        } else if selector == 2 {
            RoundView(selector:$selector, showingAddMenu:$addButtonPressed)
        } else if selector == 3 {
            CreatureView(selector:$selector, showingAddMenu:$addButtonPressed)
        }
            
        
        
    }
}

#Preview {
    TabView()
}
