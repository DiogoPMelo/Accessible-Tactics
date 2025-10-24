//
//  COmpetitions+Matches.swift
//  Tactics replica
//
//  Created by Diogo Melo on 23/10/25.
//

import Foundation

var lineUps = [brazilLineUp, franceLineUp, greeceLineUp, italyLineUp, portugalLineUp, czechLineUp, germanyLineUp, netherlandsLineUp]
    .shuffled()

var lineUpsAlt = [brazilLineUpAlt, franceLineUpAlt, greeceLineUpAlt, italyLineUpAlt]
    .shuffled()

var lineUpsAlt2 = [brazilLineUpAlt2, franceLineUpAlt2, greeceLineUpAlt2, italyLineUpAlt2]
    .shuffled()

let myCompetitions: [Competition] = [
    Competition(
        name: "International Legends",
        matches: [
            Match(home: lineUps.removeFirst(), away: lineUps.removeFirst()
                  , time: "14:00"),
            Match(home: lineUps.removeFirst(), away: lineUps.removeFirst(), time: "16:30"),
            Match(home: lineUps.removeFirst(), away: lineUps.removeFirst(), time: "18:30"),
            Match(home: lineUps.removeFirst(), away: lineUps.removeFirst(), time: "21:00")
        ]
    ),
    Competition(
        name: "Alternative Formations",
        matches: [
            Match(home: lineUpsAlt.removeFirst(), away: lineUpsAlt.removeFirst(), time: "18:00"),
            Match(home: lineUpsAlt.removeFirst(), away: lineUpsAlt.removeFirst(), time: "20:00")
        ]
    ),
    Competition(
        name: "Even more alternative ones",
        matches: [
            Match(home: lineUpsAlt2.removeFirst(), away: lineUpsAlt2.removeFirst(), time: "19:45"),
            Match(home: lineUpsAlt2.removeFirst(), away: lineUpsAlt2.removeFirst(), time: "21:00")
        ]
    )
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
