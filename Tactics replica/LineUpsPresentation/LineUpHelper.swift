//
//  LineUpHelper.swift
//  AccessibleTactics
//
//  Created by Diogo Melo on 3/19/26.
//

import Foundation

struct LineUpHelper {
    
    static let detailed = true
    
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
                
                let position = correctPositionAsString(formation: formation,
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
    
    static func correctPositionAsString(formation: [(numberOfPlayers: Int, position: Player.Position)],
                                        sector: Int,
                                        numberOfElements: Int,
                                        playerIndex: Int) -> String {
        
        if detailed {
            let correctPosition = correctPosition(formation: formation,
                                                  sector: sector,
                                                  numberOfElements: numberOfElements,
                                                  playerIndex: playerIndex)
            
            return getPositionString(formation: formation, position: correctPosition)
        } else {
            
            return formation[sector].position.asString
        }
    }
    
    static func correctPosition(formation: [(numberOfPlayers: Int, position: Player.Position)],
                                sector: Int,
                                numberOfElements: Int,
                                playerIndex: Int) -> FieldPosition {
        
        let position = formation[sector].position
        
        if position == .goalkeeper {
            
            return FieldPosition(position: .goalkeeper, side: .none)
        } else if position == .defender {
            
            return FieldPosition(position: .back,
                                 side: getDefenderSides(numberOfElements: numberOfElements, playerIndex: playerIndex))
            
        } else if position == .forward {
            
            return FieldPosition(position: .forward,
                                 side: getForwardSides(numberOfElements: numberOfElements, playerIndex: playerIndex,))
        }        else {
            
            let midfield = getMidfieldSector(formation: formation, sector: sector)
            let side = getMidfieldSides(numberOfElements: numberOfElements, playerIndex: playerIndex, position: midfield)
            
            return FieldPosition(position: midfield,
                                 side: side)
        }
    }
    
    static func getPositionString (formation: [(numberOfPlayers: Int, position: Player.Position)],
                                   position: FieldPosition) -> String {
        
        let noOfDefs = formation[1].numberOfPlayers
        
        let updatedPosition = switch (position.position, position.side, noOfDefs) {
        case (.back, let side, 5) where side == .left || side == .right:
            FieldPosition(position: .wingBack, side: position.side)
        case (.midfielder, let side, 3) where side == .left || side == .right:
            FieldPosition(position: .wingBack, side: position.side)
        case (.attackingMidfielder, let side, _) where side == .left || side == .right:
            FieldPosition(position: .winger, side: position.side)
        case (.forward, let side, _) where side == .left || side == .right:
            FieldPosition(position: .winger, side: position.side)
        default:
            position
        }
        
        return updatedPosition.side.asString + updatedPosition.position.asString
    }
    
    private static func getMidfieldSector (formation: [(numberOfPlayers: Int, position: Player.Position)],
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
    
    
    private static func getMidfieldSides(numberOfElements: Int,
                                         playerIndex: Int,
                                         position: DetailedPosition) -> Side {
        
        let sides: [Side] = switch(numberOfElements, position) {
        case (1, _):
            [.none]
        case (2, .midfielder):
            [.rightCenter, .leftCenter]
        case (2, _):
            [.none, .none]
        case (3, .attackingMidfielder):
            [.right, .none, .left]
        case (3, _):
            [.rightCenter, .center, .leftCenter]
        case (5, _):
            Side.default5
        default:
            Side.default4
        }
        
        return get(playerIndex, from: sides)
    }
    
    private static func getForwardSides(numberOfElements: Int,
                                        playerIndex: Int) -> Side {
        
        let sides: [Side] = switch(numberOfElements) {
        case 1:
            [.none]
        case 2:
            [.none, .none]
        case 3:
            [.right, .center, .left]
        default:
            Side.default4
        }
        
        return get(playerIndex, from: sides)
    }
    
    private static func getDefenderSides(numberOfElements: Int,
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
        
        return get(playerIndex, from: sides)
    }
    
    private static func get(_ index: Int,
                            from sides: [Side]) -> Side {
        
        index <= sides.count ?
        sides[index] :
            .none
    }
    
    struct FieldPosition {
        
        let position: DetailedPosition
        let side: Side
    }
    
    enum DetailedPosition: String, CaseIterable, Codable {
        case goalkeeper
        case back
        case wingBack
        case defensiveMidfielder
        case midfielder
        case attackingMidfielder
        case winger
        case forward

        var asString: String {

            switch (self) {
            case .wingBack:
                "Wing Back"
            case .defensiveMidfielder:
    "Defensive Midfielder"
            case .attackingMidfielder:
                "Attacking Midfielder"
            default:
                self.rawValue.capitalized
            }
        }
    }
    
    enum Side: String, Codable {
        case none, right, rightCenter, center, leftCenter, left
        
        static let default4: [Side] = [.right, .center, .center, .left]
        
        static let default5: [Side] =             [.right, .rightCenter, .center, .leftCenter, .left]
        
        var asString: String {
            
            switch (self) {
            case .none:
                ""
            case .leftCenter:
                "Left Center "
            case .rightCenter:
                "Right Center "
            default:
                "\(self.rawValue.capitalized) "
            }
        }
    }
}

