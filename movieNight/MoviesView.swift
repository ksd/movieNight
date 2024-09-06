//
//  MoviesView.swift
//  movieNight
//
//  Created by ksd on 23/08/2024.
//

import SwiftUI

struct MoviesView: View {
    
    @Environment(MovieViewModel.self) private var viewModel: MovieViewModel
    let showOnlyFavories: Bool
    
    @State private var deleteOffsets: IndexSet = []
    @State private var isShowingDeleteConfirmation = false
    @State private var isShowingAddNewMovieSheet = false

    var displayedMovies: [Movie] {
        viewModel.movies.filter {(!showOnlyFavories || $0.isFavorite)}
    }
    
    var body: some View {
        @Bindable var viewModel = viewModel

        NavigationStack {
            List{
                ForEach(displayedMovies, id: \.title){ movie in
                    NavigationLink {
                        DetailView(movie: movie)
                    } label: {
                        Row(movie: movie)
                    }
                }
                .onMove{(source, destination) in
                    viewModel.move(source: source, destination: destination)
                }
                .onDelete{ offsets in
                    deleteOffsets = offsets
                    isShowingDeleteConfirmation = true
                }
            }
            .navigationTitle(showOnlyFavories ? "Favorites" : "Movies")
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    EditButton()
                }
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        isShowingAddNewMovieSheet = true
                    } label: {
                        Label(
                            title: { Text("Label") },
                            icon: { Image(systemName: "plus.rectangle") }
                        )
                    }

                }
            }
            .sheet(isPresented: $isShowingAddNewMovieSheet) {
                AddNewView()
                    .presentationDetents([.medium, .large])
            }
            .confirmationDialog("Are you sure?", isPresented: $isShowingDeleteConfirmation, titleVisibility: .visible) {
                Button("Delete movie", role: .destructive) {
                    withAnimation {
                        viewModel.delete(at: deleteOffsets)
                    }
                }
                Button("Cancel", role: .cancel){}
            } message: {
                Text("The action is not reversible")
            }
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
