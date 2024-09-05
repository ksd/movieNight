//
//  Favorite.swift
//  movieNight
//
//  Created by ksd on 05/09/2024.
//

import SwiftUI

struct Favorite: View {
    @Binding var isSet: Bool
    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Label("Toggle Favorites", systemImage: isSet ? "heart.fill" : "heart")
                .labelStyle(.iconOnly)
                .foregroundStyle(isSet ? .red : .secondary)
        }
    }
}

#Preview("Favorite") {
    Group{
        Favorite(isSet: .constant(true))
        Favorite(isSet: .constant(false))
    }
}
