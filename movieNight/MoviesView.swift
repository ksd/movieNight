//
//  MoviesView.swift
//  movieNight
//
//  Created by ksd on 23/08/2024.
//

import SwiftUI

struct MoviesView: View {
    
    //@Binding var movies: [Movie]
    @Environment(MovieViewModel.self) private var viewModel: MovieViewModel
    let showOnlyFavories: Bool
    

    var displayedMovies: [Movie] {
        viewModel.movies.filter {(!showOnlyFavories || $0.isFavorite)}
    }
    
    var body: some View {
        @Bindable var viewModel = viewModel

        NavigationStack {
            List{
                ForEach(displayedMovies, id: \.title){ movie in
                    NavigationLink {
                        //DetailView(movie: $movies[index(for: movie)])
                        DetailView(movie: movie)
                    } label: {
                        Row(movie: movie)
                    }
                }
            }
            .navigationTitle(showOnlyFavories ? "Favorites" : "Movies")
        }
    }
}



#Preview("Favorites") {
    //MoviesView(movies: .constant(TestData.movies), showOnlyFavories: true)
    MoviesView(showOnlyFavories: true).environment(MovieViewModel())
    
}
#Preview("Movies") {
    //MoviesView(movies: .constant(TestData.movies), showOnlyFavories: false)
    MoviesView(showOnlyFavories: false).environment(MovieViewModel())
}
