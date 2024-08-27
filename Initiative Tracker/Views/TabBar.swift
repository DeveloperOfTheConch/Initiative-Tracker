//
//  TabBar.swift
//  Initiative Tracker
//
//  Created by Dev Conch on 2024-08-26.
//

import SwiftUI

struct TabBar: View {
    
    
    
    var body: some View {
        
        //Spacer()
        
        HStack{
            VStack{
                Image(systemName:"figure.fencing")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50,height:50)
                Text("Placeholder")
            }
            
        }
    }
}

#Preview {
    TabBar()
}
