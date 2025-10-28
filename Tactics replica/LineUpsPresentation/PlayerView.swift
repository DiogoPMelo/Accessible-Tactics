//
//  PlayerView.swift
//  Tactics replica
//
//  Created by Diogo Melo on 22/10/25.
//

import SwiftUI

struct PlayerDisplayModel: Codable, Hashable {

    let player: Player
    let position: String
    let priority: Double
}

struct PlayerView: View {
    let model: PlayerDisplayModel

    var body: some View {
        NavigationLink(destination: {

            PlayerDetailedView(player: model.player)
                    }) {
            VStack(spacing: 4) {
                // Circle with shirt number
                ZStack {
                    Circle()
                        .fill(Color.blue.opacity(0.9))
                        .frame(width: 50, height: 50)
                    Text("\(model.player.number)")
                        .font(.headline)
                        .foregroundColor(.white)
                        .bold()
                }

                // Player name under it
                Text(model.player.name)
                    .font(.caption)
                    .foregroundColor(.primary)
                    .lineLimit(1)
                    .frame(maxWidth: 60)
                    .multilineTextAlignment(.center)
            }
        }
        // Accessibility: make it one logical element for VoiceOver
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("\(model.player.nameNumber), \(model.position)")
        .accessibilityAddTraits(.isButton)
    }
}

#Preview {
    PlayerView(model: PlayerDisplayModel(player: brazil2002.players.randomElement()!, position: "Forward", priority: 0))
}
