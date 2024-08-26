//
//  RoundView.swift
//  Initiative Tracker
//
//  Created by Dev Conch on 2024-08-26.
//

import SwiftUI

struct RoundView: View {
    
    @Binding var selector: Int
    
    var body: some View {
        Text("Round View")
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
