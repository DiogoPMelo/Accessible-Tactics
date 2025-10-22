//
//  ContentView.swift
//  Tactics replica
//
//  Created by Diogo Melo on 22/10/25.
//

import SwiftUI

struct HomeTeamView: View {
    let home = franceLineUp

    var body: some View {
        VStack {
                        ForEach(Array(realFormation.enumerated()), id: \.offset) { index, fLine in
                    HStack {

                        ForEach(0..<fLine) { pos in
                            PlayerView(player: playersByPosition[index][pos])
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
    HomeTeamView()
}
