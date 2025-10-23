//
//  MatchesView.swift
//  Tactics replica
//
//  Created by Diogo Melo on 23/10/25.
//

import SwiftUI

struct MatchesView: View {
        let today = Date()
let competitions = myCompetitions

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 12) {
                // Date Header
                Text(today, style: .date)
                    .font(.headline)
                    .padding(.horizontal)
                    .padding(.top, 8)

                // Matches List
                List {

                    ForEach(competitions) { competition in

                        Section(header: Text(competition.name)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        ) {

                            // MARK: Matches
                            ForEach(competition.matches) { match in
                                NavigationLink(destination: MatchDetailView(match: match)) {
                                    HStack {
                                        VStack(alignment: .leading, spacing: 4) {
                                            Text("\(match.home.name)")
                                            Text("\(match.away.name)")
                                                .foregroundColor(.secondary)
                                        }
                                        Spacer()
                                        Text(match.time)
                                            .font(.subheadline)
                                            .foregroundColor(.gray)
                                    }
                                    .padding(.vertical, 4)
                                }
                            }
                        }
                    }
                }
                .listStyle(.insetGrouped)
            }
            .navigationTitle("Matches")
        }
    }
}


#Preview {
    MatchesView()
}
