//
//  COmpetitions+Matches.swift
//  Tactics replica
//
//  Created by Diogo Melo on 23/10/25.
//

import Foundation

var lineUps = [brazilLineUp, franceLineUp, greeceLineUp, italyLineUp]
    .shuffled()

let myCompetitions: [Competition] = [
    Competition(
        name: "International Legends",
        matches: [
            Match(home: lineUps.removeFirst(), away: lineUps.removeFirst()
                  , time: "14:00"),
            Match(home: lineUps.removeFirst(), away: lineUps.removeFirst(), time: "16:30")
        ]
    ),
//    Competition(
//        name: "La Liga",
//        matches: [
//            Match(home: "Real Madrid", away: "Barcelona", time: "18:00"),
//            Match(home: "Atletico", away: "Sevilla", time: "20:00")
//        ]
//    ),
//    Competition(
//        name: "Serie A",
//        matches: [
//            Match(home: "Juventus", away: "Inter", time: "19:45"),
//            Match(home: "Milan", away: "Napoli", time: "21:00")
//        ]
//    )
]

struct Competition: Identifiable {
    let id = UUID()
    let name: String
    let matches: [Match]
}

struct Match: Identifiable {
    let id = UUID()
    let home: LineUp
    let away: LineUp
    let time: String

    var homeVsAway: String {

        "\(home.shortName) vs \(away.shortName)"
    }
}
