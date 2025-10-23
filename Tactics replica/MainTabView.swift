//
//  MainTabView.swift
//  Tactics replica
//
//  Created by Diogo Melo on 23/10/25.
//

import SwiftUI

struct MainTabView: View {

    var body: some View {
        TabView {

            MatchesView()
                .tabItem {
                    Label("Matches", systemImage: "calendar")
                }

            NavigationStack {
                Text("We forgot what your favorite team was")
                    .font(.title3)
                    .foregroundStyle(.secondary)
                    .navigationTitle("Favorites")
            }
            .tabItem {
                Label("Favorites", systemImage: "star.fill")
            }
            .badge(1)

                        NavigationStack {
                Text("You won't be notified anyway")
                    .font(.title3)
                    .foregroundStyle(.secondary)
                    .navigationTitle("Settings")
            }
            .tabItem {
                Label("Settings", systemImage: "gearshape.fill")
            }
                    }

    }
}

#Preview {
    MainTabView()
}
