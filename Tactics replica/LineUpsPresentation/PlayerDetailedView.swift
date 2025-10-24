//
//  PlayerDetailedView.swift
//  Tactics replica
//
//  Created by Diogo Melo on 24/10/25.
//

import SwiftUI

struct PlayerDetailedView: View {
    let player: Player
    var body: some View {
        VStack {

            Text("Position: \(player.positionAsString)")
            HStack {
                Text("Club: ")
                Text(player.club)
            }
            .accessibilityElement(children: .combine)

            Text("Age: \(player.age) years old")
            Text("Height: \(player.height) cm")
        }
        .navigationTitle(player.name)
    }
}

#Preview {
    PlayerDetailedView(player: brazil2002.players.randomElement()!)
}
