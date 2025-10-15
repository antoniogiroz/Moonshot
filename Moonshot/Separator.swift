//
//  Separator.swift
//  Moonshot
//
//  Created by Antonio Giroz on 15/10/25.
//

import SwiftUI

struct Separator: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundStyle(.lightBackground)
            .padding(.vertical)
    }
}

#Preview {
    Separator().preferredColorScheme(.dark)
}
