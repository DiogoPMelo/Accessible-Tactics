//
//  Teams.swift
//  Tactics replica
//
//  Created by Diogo Melo on 22/10/25.
//

import Foundation

enum PositionalAwareness: String, CaseIterable, Codable {
    case goalkeeper
    case defender
        case defensiveMidfielder
    case midfielder
    case attackingMidfielder
    case winger
    case forward

    init(from playerEnum: Player.Position) {

        switch (playerEnum) {
            case .goalkeeper:
                self = .goalkeeper

            case .defender:
                self = .defender

            case .midfielder:
                self = .midfielder

            case .forward:
                self = .forward
        }
    }
}

struct LineUp {

    let team: Team
    let formation: [Int]
    let starting: [Int]
    let bench: [Int]

    func getStartingLineUp() -> [Player] {

        starting.map { number in

            team.players.first { $0.number == number } ?? Player(number: 0, name: "Unknown", club: "Free Agent", height: 0, age: -1, position: .goalkeeper)
        }
    }

    func realFormation() -> [(numberOfPlayers: Int, position: Player.Position)] {

        let realTactic = [1] + formation
        var sectorsNamed = [(Int, Player.Position)]()

        for (i, t) in realTactic.enumerated() {

            switch (i) {
                case 0:
                    sectorsNamed.append((t, .goalkeeper))
                case 1:
                    sectorsNamed.append((t, .defender))
                case (realTactic.count - 1):
                    sectorsNamed.append((t, .forward))
                default:
                    sectorsNamed.append((t, .midfielder))
            }
        }

        return sectorsNamed
    }

    func getSubstitutes() -> [Player] {

        if bench.isEmpty {

return createBench()
        } else {

            return team.players.filter { bench.contains($0.number) }.sorted()
        }
    }

    private func createBench() -> [Player] {

        team.players.filter { !starting.contains(($0.number) )}.sorted()
    }

    // TODO: Incomplete method to have more detailed positions
    func detailedFormation() -> [(Int, PositionalAwareness)] {

        let realFormation = realFormation()

        print(name, formationAsString)

        var complexFormation = realFormation.map { ($0.numberOfPlayers, PositionalAwareness.init(from: $0.position))}

        if realFormation.count == 5 {

            let mid1 = complexFormation[2].0
            let mid2 = complexFormation[3].0
            if mid1 == mid2 || (mid1 == 2 && mid2 == 3) {
                complexFormation[2].1 = .defensiveMidfielder
                complexFormation[3].1 = .attackingMidfielder
            } else if mid1 > mid2 {
                complexFormation[3].1 = .attackingMidfielder
            } else if mid1 < mid2 {
                complexFormation[2].1 = .defensiveMidfielder
            }
        } else if realFormation.count == 6 {

            complexFormation[2].1 = .defensiveMidfielder
            complexFormation[4].1 = .attackingMidfielder
        }

        complexFormation.forEach { print($0.1.rawValue) }

        return complexFormation
    }

    var name: String {

        team.name
    }

    var shortName: String {

        team.name.components(separatedBy: " ")[0]
    }

    var lineUpHeading: String {

"\(shortName): \(formationAsString)"
    }

    var lineUpLabel: String {

        "\(shortName): \(formationAsLabel)"
    }

    private var formationAsString: String {

        formation.map {String($0) }.joined(separator: "-")
    }

    private var formationAsLabel: String {

        formation.map {String($0) }.joined(separator: ", ")
    }
}

struct Team: Codable, Hashable {

    let name: String
    let coach: String
    let players: [Player]
}

struct Player: Codable, Hashable, Comparable {

    enum Position: String, CaseIterable, Comparable, Codable {
        case goalkeeper
        case defender
        case midfielder
        case forward

        var asString: String {

            self.rawValue.capitalized
        }

        static func < (lhs: Self, rhs: Self) -> Bool {
            allCases.firstIndex(of: lhs)! < allCases.firstIndex(of: rhs)!
        }
    }

    let number: Int
    let name: String
    let club: String
    let height: Int  // cm
    let age: Int
    let position: Position

    var nameNumber: String {

    "\(number) \(name)"
    }

    var benchLabel: String {

        "\(number). \(lastName), \(positionAsString)"
    }

    var positionAsString: String {

        position.asString
    }

    var lastName: String {

        let names = name.components(separatedBy: " ")

        return names.count <= 2 ?
        names.last! :
        names[1..<names.count].joined(separator: " ")
    }

    static func < (lhs: Self, rhs: Self) -> Bool {

        if lhs.position == rhs.position {

            return lhs.number < rhs.number
        } else {
            return lhs.position < rhs.position
        }
    }
    }

