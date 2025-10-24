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
    
    var playersByPosition: [[PlayerViewModel]] {
        
        var players = away.getStartingLineUp()
        
        players.reverse()
        
        var sectors = [[PlayerViewModel]]()
        var priority = sortingPriority
        let realFormation = away.realFormation()
        
        for (i, sec) in realFormation.reversed().enumerated() {
            
            sectors.append([PlayerViewModel]())
            for _ in 0..<sec.numberOfPlayers {
                let player = players.removeFirst()
                sectors[i].append(PlayerViewModel(player: player, position: sec.position, priority: priority))
                priority += 0.08
            }
            
        }
        
        
        return sectors
    }
}

#Preview {
    AwayTeamView(away: franceLineUp, sortingPriority: 1)
}
