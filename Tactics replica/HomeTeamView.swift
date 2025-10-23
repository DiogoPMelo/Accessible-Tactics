//
//  ContentView.swift
//  Tactics replica
//
//  Created by Diogo Melo on 22/10/25.
//

import SwiftUI

struct HomeTeamView: View {
    let home: LineUp

    var body: some View {
        VStack {
            Text("\(home.team.name), \(home.formationAsString)")
                .accessibilityAddTraits(.isHeader)
            ForEach(playersByPosition, id: \.self) { sector in

                HStack {
                    ForEach(sector, id: \.number) { player in
                        PlayerView(player: player)
                    }
                }

            }
        }
    }

    var realFormation: [Int] {

        [1] + home.formation
    }

    var playersByPosition: [[Player]] {

        var players = home.getStartingLineUp()
        var sectors = [[Player]]()

        for (i, sec) in realFormation.enumerated() {

            sectors.append([Player]())
            for _ in 0..<sec {

                let player = players.removeFirst()
                sectors[i].append(player)
            }

        }

        return sectors
    }
}

#Preview {
    HomeTeamView(home: brazilLineUp)
}
