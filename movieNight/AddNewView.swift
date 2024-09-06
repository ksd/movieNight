//
//  AddNewView.swift
//  movieNight
//
//  Created by ksd on 06/09/2024.
//

import SwiftUI

struct AddNewView: View {
    @State private var title = ""
    @State private var genre = Genre.thriller
    @State private var year = Date()
    @State private var isFavorite = true
    
    enum Genre: String, CaseIterable, Identifiable {
        case scify = "Sci-Fy"
        case thriller = "Thriller"
        case action = "Action"
        case adventure = "Adventure"
        
        var id: String { self.rawValue }
    }
    
    var body: some View {
        NavigationStack{
            Form {
                Section {
                    TextField("Titel", text: $title)
                    Picker(selection: $genre) {
                        ForEach(Genre.allCases) { genre in
                            Text(genre.rawValue).tag(genre)
                        }
                    } label: {
                        Text("Genre")
                    }.pickerStyle(.palette)
                    Toggle(isOn: $isFavorite, label: {
                        Text("Favorite")
                    })
                    Button(action: {}, label: {
                        Text("Opret film")
                    }).buttonStyle(.borderedProminent)
                }
            }
            .navigationTitle("Opret ny Film")
        }
    }
}

#Preview {
    AddNewView()
}
