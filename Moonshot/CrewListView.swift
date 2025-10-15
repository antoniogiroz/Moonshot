//
//  CrewView.swift
//  Moonshot
//
//  Created by Antonio Giroz on 15/10/25.
//

import SwiftUI

struct CrewListView: View {
    let crew: [MissionView.CrewMember]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(crew, id: \.role) { member in
                    NavigationLink {
                        AstronautView(astronaut: member.astronaut)
                    } label : {
                        HStack {
                            Image(member.astronaut.id)
                                .resizable()
                                .frame(width: 104, height: 72)
                                .clipShape(.capsule)
                                .overlay {
                                    Capsule()
                                        .strokeBorder(.white, lineWidth: 1)
                                }
                            
                            VStack(alignment: .leading) {
                                Text(member.astronaut.name)
                                    .font(.headline)
                                    .foregroundStyle(.white)
                                Text(member.role)
                                    .foregroundStyle(.white.opacity(0.6))
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
    }
}

#Preview {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    CrewListView(crew: [
        MissionView.CrewMember(astronaut: astronauts["grissom"]!, role: "Command Pilot"),
        MissionView.CrewMember(astronaut: astronauts["white"]!, role: "Senior Pilot"),
        MissionView.CrewMember(astronaut: astronauts["chaffee"]!, role: "Pilot"),
    ])
    .preferredColorScheme(.dark)
}
