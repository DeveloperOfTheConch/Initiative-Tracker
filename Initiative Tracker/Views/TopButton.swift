//
//  AddButton.swift
//  Initiative Tracker
//
//  Created by Dev Conch on 2024-09-01.
//

import SwiftUI

struct TopButton: View {
    
    var imageName: String
    
    var body: some View {
        Image(systemName:imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width:30)
            .tint(.primary)
    }
}


