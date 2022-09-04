//
//  DetailMovieView.swift
//  MovieStore
//
//  Created by Tom Huynh on 9/4/22.
//

import SwiftUI

struct DetailMovieView: View {
    let movie: Movie
    var body: some View {
        ScrollView{
            
            EmojiRatingView(rating: movie.rating)
                .font(.largeTitle)
            
            Text(movie.review ?? "No Review")
                .padding()
            
            RatingStarsView(rating: .constant(Int(movie.rating)))
                .font(.largeTitle)
            
            Text(movie.genre?.uppercased() ?? "No Genre")
                .font(.caption)
                .fontWeight(.black)
                .padding(8)
                .foregroundColor(.white)
                .background(.black.opacity(0.75))
                .clipShape(Capsule())
                .offset(x: -5, y: -5)
                .padding()
            
        }
        .navigationTitle(movie.title ?? "Unknown Movie")
        .navigationBarTitleDisplayMode(.inline)
    }
}
