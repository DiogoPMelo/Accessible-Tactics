//
//  PlayerView.swift
//  Tactics replica
//
//  Created by Diogo Melo on 22/10/25.
//

import SwiftUI

struct PlayerViewModel: Codable, Hashable {

    let player: Player
    let position: Player.Position
    let priority: Double
}

struct PlayerView: View {
    let model: PlayerViewModel

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
        .accessibilityElement(children: .combine)
        .accessibilityLabel("\(model.player.nameNumber), \(model.position.asString)")
        .accessibilityAddTraits(.isButton)
    }
}

#Preview {
    PlayerView(model: PlayerViewModel(player: brazil2002.players.randomElement()!, position: .midfielder, priority: 0))
}
