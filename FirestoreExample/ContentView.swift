//
//  ContentView.swift
//  FirestoreExample
//
//  Created by Tom Huynh on 3/9/24.
//

import SwiftUI
import FirebaseCore

struct ContentView: View {
    @State private var movie:String = ""
    
    // our movie view model object
    @StateObject private var movieViewModel = MovieViewModel()

    var body: some View {
        VStack{
            // input field for a movie name
            TextField("Enter a movie name...", text: $movie)
                .padding()
                .border(.black)
                .frame(width: 230, height: 40, alignment: .leading)
                .padding()
            

            // button to add a movie
            Button {
                self.movieViewModel.addNewMovieData(name: movie)
            } label: {
                Text("Add Movies")
                .padding()
                .foregroundColor(.white)
                .background(Color.black)
            }
            
            // List of all movies name fetched from firestore
            NavigationView {
                List {
                    ForEach(movieViewModel.movies, id: \.id) { movie in
                        Text(movie.name ?? "")
                    }
                }
                .navigationTitle("All Movies")
            }
        }

    }
}

#Preview {
    ContentView()
}
