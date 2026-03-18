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
                            .accessibilityHint("Priority \(player.priority)")
                            .accessibilitySortPriority(player.priority)
                    }
                }
            }
        }
    }
    
    var playersByPosition: [[PlayerDisplayModel]] {
        
        LineUpHelper.distributeByPosition(lineUp: away.getStartingLineUp(),
                   formation: away.realFormation(),
                   initialPriority: sortingPriority,
                   priorityIncrement: 0.08)
        .reversed()
    }
    
    var oldPlayersByPosition: [[PlayerDisplayModel]] {
        
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

struct LineUpHelper {
    
    static func distributeByPosition(lineUp: [Player],
                      formation: [(numberOfPlayers: Int, position: Player.Position)],
                      initialPriority: Double = 0,
                      priorityIncrement: Double = 0)
    -> [[PlayerDisplayModel]] {
    
        var priority = initialPriority + (priorityIncrement * 10)
        var players = lineUp
        var sectors = [[PlayerDisplayModel]]()
        
        for (i, sector) in formation.enumerated() {
            
            sectors.append([PlayerDisplayModel]())
            for p in 0..<sector.numberOfPlayers {
                let player = players.removeFirst()
                
                let position = correctPosition(formation: formation,
                                               sector: i,
                                               numberOfElements: sector.numberOfPlayers,
                                               playerIndex: p)
                
                sectors[i].append(
                    PlayerDisplayModel(player: player,
                                       position: position, priority: priority))
                priority -= priorityIncrement
            }
            
        }
        
        
        return sectors
        
    }

    static func correctPosition(formation: [(numberOfPlayers: Int, position: Player.Position)],
                                sector: Int,
                         numberOfElements: Int,
                         playerIndex: Int) -> String {
        
        let position = formation[sector].position
        let testing = true
        
        if position == .goalkeeper || !testing {
            
            return position.asString
        } else if position == .defender {
            
            return getPositionString(formation: formation,
                                     position: .back, side: getDefenderSides(numberOfElements: numberOfElements, playerIndex: playerIndex,))
            
        } else if position == .forward {

            return getPositionString(formation: formation,
                                     position: .forward, side: getForwardSides(numberOfElements: numberOfElements, playerIndex: playerIndex,))
        }        else {
            
                let midfield = getMidfieldSector(formation: formation, sector: sector)
    let side = getMidfieldSides(numberOfElements: numberOfElements, playerIndex: playerIndex, position: midfield)
                
                return getPositionString(formation: formation,
                                         position: midfield, side: side)
        }
    }

    static func getMidfieldSector (formation: [(numberOfPlayers: Int, position: Player.Position)],
                                   sector: Int) -> DetailedPosition {

        let midfields = formation.filter { $0.position == .midfielder}
        let index = sector - 2 // minus GKs & DFs
        
        if midfields.count == 1 {
            
            return .midfielder
        } else if midfields.count == 3 {
            
            return [.defensiveMidfielder, .midfielder, .attackingMidfielder][index]
        } else if midfields.count == 2{
            
            let mid1 = midfields[0].numberOfPlayers
            let mid2 = midfields[1].numberOfPlayers
            
            let midSector: [DetailedPosition] = if mid1 == mid2 || (mid1 == 2 && mid2 == 3) {
 [.defensiveMidfielder, .attackingMidfielder]
            } else if mid1 > mid2 {
                [.midfielder, .attackingMidfielder]
            } else {
                [.defensiveMidfielder, .midfielder]
            }
            return midSector[index]
        }
        
        return .midfielder
    }

    
    static func getMidfieldSides(numberOfElements: Int,
                                 playerIndex: Int,
                                 position: DetailedPosition) -> Side {
        
        let sides: [Side] = switch(numberOfElements, position) {
        case (1, _):
            [.none]
        case (2, .attackingMidfielder):
            [.rightCenter, .leftCenter]
        case (2, _):
            [.rightCenter, .leftCenter]
        case (3, .attackingMidfielder):
            [.right, .center, .left]
        case (3, _):
            [.rightCenter, .center, .leftCenter]
        case (5, _):
            Side.default5
        default:
            Side.default4
        }
        
        return playerIndex <= sides.count ?
        sides[playerIndex] :
            .none
    }
    
    static func getForwardSides(numberOfElements: Int,
                                 playerIndex: Int) -> Side {
        
        let sides: [Side] = switch(numberOfElements) {
        case 1:
            [.none]
        case 2:
            [.center, .center]
        case 3:
            [.right, .center, .left]
        default:
            Side.default4
        }
        
        return playerIndex <= sides.count ?
        sides[playerIndex] :
            .none
    }
    
    static func getDefenderSides(numberOfElements: Int,
                      playerIndex: Int) -> Side {

        let sides: [Side] = switch(numberOfElements) {
        case 1:
    [.none]
                case 2:
            [.rightCenter, .leftCenter]
        case 3:
            [.rightCenter, .center, .leftCenter]
        case 5:
            Side.default5
        default:
            Side.default4
        }
        
        return playerIndex <= sides.count ?
        sides[playerIndex] :
            .none
    }
    
    static func getPositionString (formation: [(numberOfPlayers: Int, position: Player.Position)],
                                   position: DetailedPosition,
                            side: Side) -> String {
        
        return side.asString + position.rawValue.capitalized
    }
    enum Side: String, Codable {
        case none, right, rightCenter, center, leftCenter, left
        
        static let default4: [Side] = [.right, .center, .center, .left]
        
        static let default5: [Side] =             [.right, .rightCenter, .center, .leftCenter, .left]
        var asString: String {

            self == .none ?
            "" : "\(self.rawValue.capitalized) "
        }
    }
    
    enum DetailedPosition: String, CaseIterable, Codable {
                case back
            case defensiveMidfielder
        case midfielder
        case attackingMidfielder
        case winger
        case forward

    }
}

#Preview {
    AwayTeamView(away: franceLineUp, sortingPriority: 1)
}
