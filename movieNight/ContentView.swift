//
//  ContentView.swift
//  movieNight
//
//  Created by ksd on 04/09/2024.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        TabView {
            NavigationStack {
                MoviesView(showOnlyFavories: false)
            }
            .tabItem {
                Image(systemName: "list.bullet")
                    .font(.system(size: 26))
                Text("All Movies")
            }
            
            NavigationStack {
                MoviesView(showOnlyFavories: true)
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
    ContentView().environment(MovieViewModel())
}
