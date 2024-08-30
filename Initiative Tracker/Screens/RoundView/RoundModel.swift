//
//  RoundModel.swift
//  Initiative Tracker
//
//  Created by Dev Conch on 2024-08-29.
//

import SwiftUI

final class RoundModel: ObservableObject {
    
    @Published var selectedList: [UUID] = []
    @Published var realList: [Creature] = []
    
}
