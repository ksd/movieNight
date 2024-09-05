//
//  movieNightApp.swift
//  movieNight
//
//  Created by ksd on 23/08/2024.
//

import SwiftUI

@main
struct movieNightApp: App {
    @State private var viewModel = MovieViewModel()
    var body: some Scene {
        WindowGroup {
           //ContentView()
            ContentView().environment(viewModel)
        }
    }
}
