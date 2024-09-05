//
//  DetailView.swift
//  movieNight
//
//  Created by ksd on 28/08/2024.
//

import SwiftUI

struct DetailView: View {
    
    let movie: Movie
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                Image(movie.poster)
                    .resizable()
                    .frame(width: 150, height: 237)
                    .cornerRadius(8)
                    .shadow(color: .gray, radius: 10, x:5, y:5)
                SideInfo(movie: movie)
            }
            BottomInfo(movie: movie)
            Spacer()
        }
        .padding(.top, 18)
        .padding(.horizontal, 20)
            .navigationTitle(movie.title)
    }
}

#Preview {
    DetailView(movie: TestData.movies[1]).environment(MovieViewModel())
}
