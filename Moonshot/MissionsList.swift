//
//  MissionsList.swift
//  Moonshot
//
//  Created by Antonio Giroz on 15/10/25.
//

import SwiftUI

struct MissionsList: View {
    let missions: [Mission]
    
    var body: some View {
        List(missions) { mission in
            NavigationLink(value: mission) {
                HStack(spacing: 16) {
                    Image(mission.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                    
                    VStack(alignment: .leading) {
                        Text(mission.displayName)
                            .font(.headline)
                            .foregroundStyle(.white)
                        Text(mission.formattedLaunchDate)
                            .font(.caption)
                            .foregroundStyle(.white.opacity(0.6))
                    }
                }
            }
            .listRowBackground(Color.darkBackground)
            .listRowSeparatorTint(.lightBackground)
        }
        .listStyle(.plain)
    }
}

#Preview {
    MissionsList(missions: Bundle.main.decode("missions.json"))
        .preferredColorScheme(.dark)
}
