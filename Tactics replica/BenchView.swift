//
//  BenchView.swift
//  Tactics replica
//
//  Created by Diogo Melo on 22/10/25.
//

import SwiftUI

struct BenchView: View {
    let team: LineUp

    var body: some View {
        VStack {
            Text("\(team.team.name) bench")
                .accessibilityAddTraits(.isHeader)

            ForEach(team.getSubstitutes(), id: \.number) { player in
                HStack {
                    Text("\(player.number)")
                    Text(player.name)
                }
                .accessibilityElement(children: .ignore)
                .accessibilityLabel("\(player.number), \(player.name) (\(player.position.rawValue.capitalized)")
            }
            Text("Coach: \(team.team.coach)")
        }
    }
}

#Preview {
    BenchView(team: italyLineUp)
}
