//
//  MissionsGrid.swift
//  Moonshot
//
//  Created by Antonio Giroz on 15/10/25.
//

import SwiftUI

struct MissionsGrid: View {
    let astronauts: [String: Astronaut]
    let missions: [Mission]
    
    let columns = [ GridItem(.adaptive(minimum: 150)) ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 26) {
                ForEach(missions) { mission in
                    NavigationLink {
                        MissionView(mission: mission, astronauts: astronauts)
                    } label : {
                        VStack {
                            Image(mission.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .padding()
                            
                            VStack {
                                Text(mission.displayName)
                                    .font(.headline)
                                    .foregroundStyle(.white)
                                Text(mission.formattedLaunchDate)
                                    .font(.caption)
                                    .foregroundStyle(.white.opacity(0.6))
                            }
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .background(.lightBackground)
                        }
                        .clipShape(.rect(cornerRadius: 10))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.lightBackground)
                        )
                    }
                }
            }
            .padding([.horizontal, .bottom])
        }
    }
}

#Preview {
    MissionsGrid(astronauts: Bundle.main.decode("astronauts.json"), missions: Bundle.main.decode("missions.json"))
        .preferredColorScheme(.dark)
}
