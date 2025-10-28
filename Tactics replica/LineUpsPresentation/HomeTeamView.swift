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
            Text(home.lineUpHeading)
                .font(.headline)
                .accessibilityLabel("Home team: \(home.lineUpLabel)")
                .accessibilityAddTraits(.isHeader)
            ForEach(playersByPosition, id: \.self) { sector in
                
                HStack {
                    ForEach(sector, id: \.self) { player in
                        PlayerView(model: player)
                    }
                }
                
            }
        }
    }
    
    var playersByPosition: [[PlayerDisplayModel]] {
        
        var players = home.getStartingLineUp()
        var sectors = [[PlayerDisplayModel]]()
        
        for (i, sec) in home.realFormation().enumerated() {
            
            sectors.append([PlayerDisplayModel]())
            for _ in 0..<sec.numberOfPlayers {
                
                let player = players.removeFirst()
                sectors[i].append(PlayerDisplayModel(player: player, position: sec.position.asString, priority: 0))
            }
            
        }
        
        return sectors
    }
}

#Preview {
    HomeTeamView(home: brazilLineUp)
}
