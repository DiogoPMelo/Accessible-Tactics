//
//  LineUpsView.swift
//  Tactics replica
//
//  Created by Diogo Melo on 22/10/25.
//

import SwiftUI

struct LineUpsView: View {
    let homeTeam: LineUp
    let awayTeam: LineUp

    var body: some View {
        ScrollView {
            Group {
                HomeTeamView(home: homeTeam)
            }
            .accessibilitySortPriority(3)
            AwayTeamView(away: awayTeam,
            sortingPriority: 2)
            Group {
                Text("Substitutes")
                    .accessibilityAddTraits(.isHeader)
                    .accessibilitySortPriority(1)
                HStack {
BenchView(team: homeTeam)
                        .accessibilitySortPriority(0.9)
                    BenchView(team: awayTeam)
                        .accessibilitySortPriority(0.8)
                }
            }


        }
    }
}

#Preview {
    LineUpsView(homeTeam: brazilLineUp, awayTeam: franceLineUp)
}
