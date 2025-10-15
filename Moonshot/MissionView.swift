//
//  MissionView.swift
//  Moonshot
//
//  Created by Antonio Giroz on 14/10/25.
//

import SwiftUI

struct MissionView: View {
    struct CrewMember: Hashable {
        let astronaut: Astronaut
        let role: String
    }
    
    let mission: Mission
    let crew: [CrewMember]

    var body: some View {
        ScrollView {
            VStack {
                VStack(spacing: 16) {
                    Image(mission.imageName)
                        .resizable()
                        .scaledToFit()
                        .containerRelativeFrame(.horizontal) { width, axis in
                            width * 0.6
                        }
                        .padding(.top)
                    
                    if let date = mission.launchDate {
                        Label(date.formatted(date: .complete, time: .omitted), systemImage: "calendar")
                    }
                }

                VStack(alignment: .leading) {
                    Separator()
                    
                    Text("Mission Highlights")
                        .font(.title.bold())
                        .padding(.bottom, 5)

                    Text(mission.description)
                    
                    Separator()
                    
                    Text("Crew")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                }
                .padding(.horizontal)
                
                CrewListView(crew: crew)
            }
            .padding(.bottom)
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(astronaut: astronaut, role: member.role)
            }
            fatalError("Missing \(member.name)")
        }
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")

    return MissionView(mission: missions[1], astronauts: astronauts)
        .preferredColorScheme(.dark)
}
