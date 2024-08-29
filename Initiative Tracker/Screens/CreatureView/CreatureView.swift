//
//  CreatureView.swift
//  Initiative Tracker
//
//  Created by Dev Conch on 2024-08-26.
//

import SwiftUI

struct CreatureView: View {
    
    @Binding var selector: Int
    
    var body: some View {
        Text("Creature View")
        Button {
            selector = 1
        } label: {
            Text("Next")
        }
    }
}

#Preview {
    CreatureView(selector:.constant(3))
}
