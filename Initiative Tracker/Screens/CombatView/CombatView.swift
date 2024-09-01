//
//  CombatView.swift
//  Initiative Tracker
//
//  Created by Dev Conch on 2024-08-26.
//

import SwiftUI

struct CombatView: View {
    
    @Binding var selector: Int
    @Binding var showingAddMenu: Bool
    
    var body: some View {
        Text("Combat View")
        Button {
            selector = 2
        } label: {
            Text("Next")
        }
    }
}

#Preview {
    CombatView(selector:.constant(1),showingAddMenu: .constant(false))
}
