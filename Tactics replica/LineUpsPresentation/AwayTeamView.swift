//
//  AwayTeamView.swift
//  Tactics replica
//
//  Created by Diogo Melo on 22/10/25.
//

import SwiftUI

struct AwayTeamView: View {
    let away: LineUp
    let sortingPriority: Double
    
    var body: some View {
        VStack {
            Text(away.lineUpHeading)
                .font(.headline)
                .accessibilityLabel("Away team: \(away.lineUpLabel)")
                .accessibilityAddTraits(.isHeader)
                .accessibilitySortPriority(sortingPriority + 0.95)
            
            ForEach(playersByPosition, id: \.self) { sector in

                HStack {
                    ForEach(sector, id: \.self) { player in
                        
                        PlayerView(model: player)
                            .accessibilitySortPriority(player.priority)
                    }
                }
            }
        }
    }
    
    var playersByPosition: [[PlayerDisplayModel]] {
        
        var players = away.getStartingLineUp()
        players.reverse()
        
        var sectors = [[PlayerDisplayModel]]()
        var priority = sortingPriority
        let realFormation = away.realFormation()
        
        for (i, sector) in realFormation.reversed().enumerated() {
            
            sectors.append([PlayerDisplayModel]())
            for _ in 0..<sector.numberOfPlayers {
                let player = players.removeFirst()
                sectors[i].append(PlayerDisplayModel(player: player, position: sector.position.asString, priority: priority))
                priority += 0.08
            }
            
        }
        
        
        return sectors
    }
}

#Preview {
    AwayTeamView(away: franceLineUp, sortingPriority: 1)
}
