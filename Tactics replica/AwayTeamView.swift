//
//  AwayTeamView.swift
//  Tactics replica
//
//  Created by Diogo Melo on 22/10/25.
//

import SwiftUI

struct AwayTeamView: View {
    let away = franceLineUp

    var body: some View {
        VStack {
            Text("\(away.team.name) (\(away.formation))")
                .accessibilityAddTraits(.isHeader)
            ForEach(Array(realFormation.enumerated()), id: \.offset) { index, fLine in
                HStack {

                    ForEach(0..<fLine) { pos in
                        PlayerView(player: playersByPosition[index][pos])
                            .accessibilitySortPriority(sortingPriority[index][pos])
                    }
                }
            }
        }
    }

    var realFormation: [Int] {

        ([1] + away.formation).reversed()
    }

    var sortingPriority: [[Double]] {

        var initial = -12.0
var priorities = [[Double]]()
        for (i, l) in playersByPosition.enumerated() {
            priorities.append([Double]())
            for p in l {
                priorities[i].append(initial)
                initial += 1

            }

        }

        return priorities

    }

    var playersByPosition: [[Player]] {

        var players = away.getStartingLineUp()
        players.reverse()
        var toReturn = [[Player]]()
        for (i, p) in realFormation.enumerated() {
            toReturn.append([Player]())
            for _ in 0..<p {
                let player = players.removeFirst()
                toReturn[i].append(player)
            }

        }


        return toReturn
    }
}

#Preview {
    AwayTeamView()
}
