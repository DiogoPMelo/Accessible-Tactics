//
//  PlayerView.swift
//  Tactics replica
//
//  Created by Diogo Melo on 22/10/25.
//

import SwiftUI

struct PlayerView: View {
    let player: Player

    var body: some View {
        VStack(spacing: 4) {
            // Circle with shirt number
            ZStack {
                Circle()
                    .fill(Color.blue.opacity(0.9))
                    .frame(width: 50, height: 50)
                Text("\(player.number)")
                    .font(.headline)
                    .foregroundColor(.white)
                    .bold()
            }

            // Player name under it
            Text(player.name)
                .font(.caption)
                .foregroundColor(.primary)
                .lineLimit(1)
                .frame(maxWidth: 60)
                .multilineTextAlignment(.center)
        }
        // Accessibility: make it one logical element for VoiceOver
        .accessibilityElement(children: .combine)
//        .accessibilityLabel("\(name), number \(number)")
    }
}
