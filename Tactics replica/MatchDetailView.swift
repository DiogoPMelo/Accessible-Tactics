//
//  MatchDetailView.swift
//  Tactics replica
//
//  Created by Diogo Melo on 23/10/25.
//

import SwiftUI

struct MatchDetailView: View {
    let match: Match

    let homeScore: Int = Int.random(in: 1...4)
    let awayScore: Int = Int.random(in: 0...3)

    @State private var selectedTab: MatchDetailTab = .lineups

    var body: some View {
        VStack(spacing: 0) {
            // MARK: - Header
            VStack(spacing: 8) {
                Text("\(match.home.name) vs \(match.away.name)")
                    .font(.headline)
                    .accessibilityAddTraits(.isHeader)

                HStack(alignment: .firstTextBaseline, spacing: 12) {
                    Text("\(homeScore)")
                        .font(.system(size: 36, weight: .bold))
                    Text("-")
                        .font(.title2)
                    Text("\(awayScore)")
                        .font(.system(size: 36, weight: .bold))
                }
                .accessibilityElement(children: .ignore)
                .accessibilityLabel("\(homeScore) - \(awayScore)")

                Text(match.time)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .accessibilityLabel("Kickoff at \(match.time)")
            }
            .padding()

            Divider()

            // MARK: - Toolbar / Tabs
            Picker("Match Detail Section", selection: $selectedTab) {
                ForEach(MatchDetailTab.allCases, id: \.self) { tab in
                    Text(tab.tabTitle)
                        .tag(tab)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            Divider()

            // MARK: - Content
            Group {
                switch selectedTab {
                    case .events:
                        MatchEventsView()
                    case .statistics:
                        StatisticsView()
                    case .liveTable:
                        LiveTableView()
                    case .lineups:
                        LineUpsView(homeTeam: match.home, awayTeam: match.away)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .navigationBarTitleDisplayMode(.inline)
    }

    enum MatchDetailTab: String, CaseIterable {
        case events, statistics, liveTable, lineups

        var tabTitle: String {

            switch (self) {
                case .events:
return "Events"
                case .lineups:
return "Line Ups"
                case .liveTable:
return "Live Table"
                case .statistics:
                    return "Statistics"

            }
        }
    }
}


// MARK: - Placeholder Subviews

struct MatchEventsView: View {
    var body: some View {
        Text("It is not even a real match")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
}

struct StatisticsView: View {
    var body: some View {
        Text("XG rules")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
}

struct LiveTableView: View {
    var body: some View {
        Text("Can't even see Man Utd")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct MatchDetailViewOld: View {
    let match: Match

    var body: some View {
        LineUpsView(homeTeam: match.home, awayTeam: match.away)
            .toolbar {
                
                Button("Help") {
                    print("Help tapped!")
                }
                Button("Ajuda") {
                    print("Help tapped!")
                }
                Button("Socorro") {
                    print("Help tapped!")
                }
            }
            .navigationTitle(match.homeVsAway)
    }
}

#Preview {
    MatchDetailView(match: Match(home: brazilLineUp, away: portugalLineUp, time: "14:00"))
}
