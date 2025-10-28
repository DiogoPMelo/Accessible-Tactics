//
//  BenchView.swift
//  Tactics replica
//
//  Created by Diogo Melo on 22/10/25.
//

import SwiftUI

struct BenchView: View {
    let team: LineUp

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {

            // Header
            Text("\(team.shortName) Substitutes")
                .font(.headline)
                .accessibilityAddTraits(.isHeader)
                .padding(.bottom, 4)

            // Substitutes list
            ForEach(team.getSubstitutes(), id: \.number) { player in
                NavigationLink(destination: PlayerDetailedView(player: player)) {
                    HStack(spacing: 12) {
                        // Player number badge
                        Text("\(player.number)")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 32, height: 32)
                            .background(Color.blue.opacity(0.1))
                            .clipShape(Circle())

                        VStack(alignment: .leading, spacing: 2) {
                            Text(player.lastName)
                                .font(.body)
                                .fontWeight(.medium)
                            Text(player.positionAsString)
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }

                        Spacer()
                    }
                    .padding(.vertical, 6)
                    .padding(.horizontal, 8)
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(8)
                }
                // VoiceOver label
                .accessibilityElement(children: .ignore)
                .accessibilityLabel(player.benchLabel)
            }

            Divider().padding(.vertical, 8)

            // Coach
            Text("Coach: \(team.team.coach)")
                .font(.subheadline)
        }
        .padding()
    }
}

#Preview {
    BenchView(team: italyLineUp)
}
