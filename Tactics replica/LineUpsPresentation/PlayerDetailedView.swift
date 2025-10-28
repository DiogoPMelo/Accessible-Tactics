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
        ScrollView {
            VStack(spacing: 24) {

                // Player name and position badge
                VStack(spacing: 8) {
                    Text(player.positionAsString)
                        .font(.headline)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(Color.blue.opacity(0.1))
                        .clipShape(Capsule())
                        .accessibilityLabel("Position: \(player.positionAsString)")
                }
                .padding(.top)

                Divider()

                // Stats section
                VStack(alignment: .leading, spacing: 16) {
                    HStack {
                        Image(systemName: "shield")
                            .accessibilityHidden(true)
                        Text(player.club)
                            .font(.body)
                            .accessibilityLabel("Club: \(player.club)")
                    }

                    HStack {
                        Image(systemName: "calendar")
                            .accessibilityHidden(true)
                        Text("\(player.age) years old")
                            .font(.body)
                            .accessibilityLabel("Age: \(player.age) years old")
                    }

                    HStack {
                        Image(systemName: "ruler")
                            .accessibilityHidden(true)
                        Text("\(player.height) cm")
                            .font(.body)
                            .accessibilityLabel("Height: \(player.height) centimeters")
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)

                Spacer()
            }
            .padding()
        }
        .navigationTitle(player.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    PlayerDetailedView(player: brazil2002.players.randomElement()!)
}
