//
//  Movie.swift
//  movieNight
//
//  Created by ksd on 23/08/2024.
//

import SwiftUI

struct Movie {
    
    var title: String
    let year: String
    let runtime: String
    let genre: String
    let director: String
    let actors: String
    let plot: String
    let country: String
    let awards: String
    let poster: String
    var isFavorite: Bool
}

@Observable
class MovieViewModel {
    var movies = TestData.movies
    
    func move(source: IndexSet, destination: Int){
        movies.move(fromOffsets: source, toOffset: destination)
    }
    
    func delete(at offsets: IndexSet){
        movies.remove(atOffsets: offsets)
    }
}

struct TestData {
     static var movies = [
        Movie(title: "Alita: Battle Angel",
              year: "2019",
              runtime: "122 min",
              genre: "Action, Adventure, Sci-Fi, Thriller",
              director: "Robert Rodriguez",
              actors: "Rosa Salazar, Christoph Waltz, Jennifer Connelly, Mahershala Ali",
              plot: "A deactivated cyborg is revived, but cannot remember anything of her past life and goes on a quest to find out who she is.",
              country: "USA",
              awards: "8 wins & 25 nominations.",
              poster: "Alita",
              isFavorite: true),
        
        Movie(title: "Edge of Tomorrow",
              year: "2014",
              runtime: "113 min",
              genre: "Action, Sci-Fi",
              director: "Doug Liman",
              actors: "Tom Cruise, Emily Blunt, Brendan Gleeson, Bill Paxton",
              plot: "A soldier fighting aliens gets to relive the same day over and over again, the day restarting every time he dies.",
              country: "USA, Canada",
              awards: "11 wins & 37 nominations.",
              poster: "Edge of Tomorrow",
              isFavorite: false),
        
        Movie(title: "Blade Runner 2049",
              year: "2017",
              runtime: "164 min",
              genre: "Action, Drama, Mystery, Sci-Fi, Thriller",
              director: "Denis Villeneuve",
              actors: "Ryan Gosling, Dave Bautista, Robin Wright, Mark Arnold",
              plot: "Young Blade Runner K's discovery of a long-buried secret leads him to track down former Blade Runner Rick Deckard, who's been missing for thirty years.",
              country: "USA, UK, Hungary, Canada, Spain",
              awards: "Won 2 Oscars. Another 97 wins & 159 nominations.",
              poster: "Blade Runner 2049",
              isFavorite: true),
        
        Movie(title: "Inception",
              year: "2010",
              runtime: "148 min",
              genre: "Action, Adventure, Sci-Fi, Thriller",
              director: "Christopher Nolan",
              actors: "Leonardo DiCaprio, Joseph Gordon-Levitt, Ellen Page, Tom Hardy",
              plot: "A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O.",
              country: "USA, UK",
              awards: "Won 4 Oscars. Another 152 wins & 217 nominations.",
              poster: "Inception",
              isFavorite: false),
        
        Movie(title: "The Matrix",
              year: "1999",
              runtime: "136 min",
              genre: "Action, Sci-Fi",
              director: "Lana Wachowski, Lilly Wachowski",
              actors: "Keanu Reeves, Laurence Fishburne, Carrie-Anne Moss, Hugo Weaving",
              plot: "A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers.",
              country: "USA",
              awards: "Won 4 Oscars. Another 37 wins & 50 nominations.",
              poster: "The Matrix",
              isFavorite: true),
        
        Movie(title: "Guardians of the Galaxy Vol. 2",
              year: "2017",
              runtime: "136 min",
              genre: "Action, Adventure, Comedy",
              director: "James Gunn",
              actors: "Chris Pratt, Zoe Saldana, Dave Bautista",
              plot:  "The Guardians struggle to keep together as a team while dealing with their personal family issues, notably Star-Lord's encounter with his father, the ambitious celestial being Ego.",
              country: "United States",
              awards: "Nominated for 1 Oscar. 15 wins & 60 nominations total",
              poster: "Guardians of the Galaxy Vol. 2",
              isFavorite: false)
    ]
}
