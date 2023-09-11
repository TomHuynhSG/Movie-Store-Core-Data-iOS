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
            Text(movie.title ?? "No Title")
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


struct DetailMovieView_Previews: PreviewProvider {
    static var previews: some View {
        let moc = DataController.shared.container.viewContext
        let newMovie = Movie(context: moc)
        newMovie.title = "Sample Movie"
        newMovie.genre = "Action"
        newMovie.review = "This is a sample review."
        newMovie.rating = 4
        return DetailMovieView(movie: newMovie)
            .environment(\.managedObjectContext, moc)
    }
}
