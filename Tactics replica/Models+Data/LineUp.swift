//
//  Teams.swift
//  Tactics replica
//
//  Created by Diogo Melo on 22/10/25.
//

import Foundation

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

    func getSubstitutes() -> [Player] {

        team.players.filter { bench.contains($0.number) }.sorted()
    }

    var formationAsString: String {

        formation.map {String($0) }.joined(separator: "-")
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
}

struct Team: Codable, Hashable {

    let name: String
    let coach: String
    let players: [Player]
}

struct Player: Codable, Hashable, Comparable {

    let number: Int
    let name: String
    let club: String
    let height: Int  // cm
    let age: Int     // in 2002
    let position: Position

    enum Position: String, CaseIterable, Comparable, Codable {
        case goalkeeper
        case defender
        case midfielder
        case forward

        static func < (lhs: Self, rhs: Self) -> Bool {
            allCases.firstIndex(of: lhs)! < allCases.firstIndex(of: rhs)!
        }
    }

    static func < (lhs: Self, rhs: Self) -> Bool {

        if lhs.position == rhs.position {

            return lhs.number < rhs.number
        } else {
            return lhs.position < rhs.position
        }
    }
}

