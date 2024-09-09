//
//  DetailMovieView.swift
//  MovieStore
//
//  Created by Tom Huynh on 9/4/22.
//

import SwiftUI
import SwiftData

struct DetailMovieView: View {
    let movie: Movie
    var body: some View {
        ScrollView{
            
            EmojiRatingView(rating: movie.rating)
                .font(.largeTitle)
            Text(movie.title)
                .font(.largeTitle)
            
            Text(movie.review)
                .padding()
            
            RatingStarsView(rating: .constant(Int(movie.rating)))
                .font(.largeTitle)
            
            Text(movie.genre.uppercased())
                .font(.caption)
                .fontWeight(.black)
                .padding(8)
                .foregroundColor(.white)
                .background(.black.opacity(0.75))
                .clipShape(Capsule())
                .offset(x: -5, y: -5)
                .padding()
            
        }
        .navigationTitle(movie.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

