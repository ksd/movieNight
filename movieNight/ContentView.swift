//
//  ContentView.swift
//  movieNight
//
//  Created by ksd on 04/09/2024.
//

import SwiftUI

struct ContentView: View {
    @State var movies = TestData.movies
    var body: some View {
        
        TabView {
            NavigationStack {
                MoviesView(movies: $movies, showOnlyFavories: false)
            }
            .tabItem {
                Image(systemName: "list.bullet")
                    .font(.system(size: 26))
                Text("All Movies")
            }
            
            NavigationStack {
                MoviesView(movies: $movies, showOnlyFavories: true)
            }
            .tabItem {
                Image(systemName: "heart")
                    .font(.system(size: 26))
                Text("favorites")
            }
        }
    }
}

#Preview {
    ContentView()
}
