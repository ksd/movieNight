//
//  MoviesView.swift
//  movieNight
//
//  Created by ksd on 23/08/2024.
//

import SwiftUI

struct MoviesView: View {
    
    @Binding var movies: [Movie]
    let showOnlyFavories: Bool
    
    var displayedMovies: [Movie] {
         showOnlyFavories 
        ? movies.filter {$0.isFavorite}
        : movies
    }
    func index(for movie: Movie) -> Int {
        movies.firstIndex{ $0.title == movie.title}!
    }
    
    var body: some View {
    
        /*
         - ToDo : Fix fejl der bevirker at isFavorite ikke opdateres i GUI når movie vælges fra favoritesListen
         */
        NavigationStack {
            List{
                ForEach(displayedMovies, id: \.title){ movie in
                    NavigationLink {
                        DetailView(movie: $movies[index(for: movie)])
                    } label: {
                        Row(movie: movie)
                    }
                }
            }
            .navigationTitle(showOnlyFavories ? "Favorites" : "Movies")
        }
    }
}



#Preview {
    MoviesView(movies: .constant(TestData.movies), showOnlyFavories: true)
}
#Preview {
    MoviesView(movies: .constant(TestData.movies), showOnlyFavories: false)
}
