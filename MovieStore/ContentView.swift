//
//  ContentView.swift
//  MovieStore
//
//  Created by Tom Huynh on 9/4/22.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\.title)]) var movies: FetchedResults<Movie>
    
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
                            Text(movie.title ?? "Unknown Movie")
                                .font(.headline)
                            Text(movie.genre ?? "Unknown Movie")
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
            moc.delete(movie)
            try? moc.save()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
