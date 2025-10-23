//
//  MatchDetailView.swift
//  Tactics replica
//
//  Created by Diogo Melo on 23/10/25.
//

import SwiftUI

struct MatchDetailView: View {
    let match: Match

    var body: some View {
        LineUpsView(homeTeam: match.home, awayTeam: match.away)
            .navigationTitle(match.homeVsAway)
    }
}

#Preview {
//    MatchDetailView()
}
