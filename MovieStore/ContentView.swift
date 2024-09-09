//
//  ContentView.swift
//  MovieStore
//
//  Created by Tom Huynh on 9/4/22.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: \Movie.title) var movies: [Movie]
    
    
    @State private var showingAddScreen = false
    
    var body: some View {
        NavigationView{

            List {
                ForEach(movies) { movie in
                    NavigationLink{
                        DetailMovieView(movie: movie)
                    } label: {
                        EmojiRatingView(rating: movie.rating)
                            .font(.largeTitle)

                        VStack(alignment: .leading){
                            Text(movie.title)
                                .font(.headline)
                            Text(movie.genre)
                                .font(.headline)
                        }
                    }
                }
                .onDelete(perform: deleteMovies)
            }
                .navigationTitle("Movie Store (\(movies.count))")
                .toolbar{
                    
                    ToolbarItem(placement: .navigationBarLeading) {
                        EditButton()
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button {
                            showingAddScreen.toggle()
                        } label: {
                            Label("Add Movie", systemImage: "plus")
                        }
                    }
                }
                .sheet(isPresented: $showingAddScreen){
                    AddMovieView()
                }
        }
    }
    
    func deleteMovies(at offsets: IndexSet) {
        for offset in offsets {
            let movie = movies[offset]
            modelContext.delete(movie)
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Movie.self)
}
