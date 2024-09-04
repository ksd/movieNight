//
//  BottomInfo.swift
//  Movie
//
//  Created by ksd on 14/08/2024.
//

import SwiftUI

struct BottomInfo: View {
    let movie: Movie
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16.0) {
            VStack(alignment: .leading) {
                Text("Directed by:")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                Text(movie.director)
                    .font(.headline)
            }
            VStack(alignment: .leading) {
                Text("Actors:")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                Text(movie.actors)
                    .font(.headline)
            }
            Divider()
            Text(movie.plot)
                .font(.body)
        }
    }
}

#Preview {
    BottomInfo(movie: TestData.movies[0])
        .padding()
}
