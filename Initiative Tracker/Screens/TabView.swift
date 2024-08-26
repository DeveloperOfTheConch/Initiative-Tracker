//
//  TabView.swift
//  Initiative Tracker
//
//  Created by Dev Conch on 2024-08-26.
//

import SwiftUI

struct TabView: View {
    
    @State private var selector: Int = 1
    
    var body: some View {
    
        if selector == 1{
            CombatView(selector:$selector)
        } else if selector == 2 {
            RoundView(selector:$selector)
        } else if selector == 3 {
            CreatureView(selector:$selector)
        }
            
        
        
    }
}

#Preview {
    TabView()
}
