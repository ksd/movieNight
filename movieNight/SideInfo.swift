//
//  SideInfo.swift
//  Movie
//
//  Created by ksd on 14/08/2024.
//

import SwiftUI

struct SideInfo: View {
    @Environment(MovieViewModel.self) var viewModel
    var movie: Movie
    
    func index(for movie: Movie) -> Int {
        viewModel.movies.firstIndex{ $0.title == movie.title}!
    }
    
    var body: some View {
        @Bindable var bindableViewModel = viewModel
        VStack(alignment: .leading, spacing: 8.0) {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 8.0) {
                    Text("\(movie.year), \(movie.country)")
                    Text(movie.genre)
                    Text(movie.runtime)
                }
                .font(.callout)
                .foregroundStyle(.secondary)
                .padding(.top, 6)
                Spacer()
                Favorite(isSet: $bindableViewModel.movies[index(for: movie)].isFavorite)
            }
            Text(movie.awards)
                .font(.callout)
                .foregroundStyle(.secondary)
        }
    }
}



#Preview("Wow!", body: {
    SideInfo(movie:TestData.movies[0]).environment(MovieViewModel()).padding()
})
