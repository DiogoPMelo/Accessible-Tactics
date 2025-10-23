//
//  AwayTeamView.swift
//  Tactics replica
//
//  Created by Diogo Melo on 22/10/25.
//

import SwiftUI

struct AwayPlayer: Codable, Hashable {

    let player: Player
    let priority: Double
}

struct AwayTeamView: View {
    let away: LineUp
    let sortingPriority: Double

    var body: some View {
        VStack {
            Text(away.lineUpHeading)
                .accessibilityLabel("Away team: \(away.lineUpHeading)")
                .accessibilityAddTraits(.isHeader)
                .accessibilitySortPriority(sortingPriority + 0.95)

            ForEach(playersByPosition, id: \.self) { sector in

                HStack {
                    ForEach(sector, id: \.self) { player in

                        PlayerView(player: player.player)
                            .accessibilitySortPriority(player.priority)
                    }
                }
            }
        }
    }

    var realFormation: [Int] {

        ([1] + away.formation).reversed()
    }

    var playersByPosition: [[AwayPlayer]] {

        var players = away.getStartingLineUp()

        players.reverse()

        var sectors = [[AwayPlayer]]()
        var priority = sortingPriority

        for (i, sec) in realFormation.enumerated() {

            sectors.append([AwayPlayer]())
            for _ in 0..<sec {
                let player = players.removeFirst()
                sectors[i].append(AwayPlayer(player: player, priority: priority))
                priority += 0.08
            }

        }


        return sectors
    }
}

#Preview {
    AwayTeamView(away: franceLineUp, sortingPriority: 1)
}
