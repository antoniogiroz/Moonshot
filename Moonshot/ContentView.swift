//
//  ContentView.swift
//  Moonshot
//
//  Created by Antonio Giroz on 13/10/25.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    @AppStorage("showAsGrid") private var showAsGrid = true
    
    var body: some View {
        NavigationStack {
            Group {
                if showAsGrid {
                    MissionsGrid(missions: missions)
                } else {
                    MissionsList(missions: missions)
                }
            }
            .navigationTitle("Moonshot")
            .preferredColorScheme(.dark)
            .background(.darkBackground)
            .toolbar {
                ToolbarItem {
                    Button(
                        showAsGrid ? "Show as List" : "Show as Grid",
                        systemImage: showAsGrid ? "list.dash" : "square.grid.2x2"
                    ) {
                        showAsGrid.toggle()
                    }
                }
            }
            .navigationDestination(for: Mission.self) { mission in
                MissionView(mission: mission, astronauts: astronauts)
            }
        }
    }
}
        
#Preview {
    ContentView()
}
