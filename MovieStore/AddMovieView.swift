//
//  AddMovieView.swift
//  MovieStore
//
//  Created by Tom Huynh on 9/4/22.
//

import SwiftUI

struct AddMovieView: View {
    @Environment(\.managedObjectContext) var moc
    
    @State private var title = ""
    @State private var genre = ""
    @State private var rating = 3
    @State private var review = ""
    
    let genres = ["Drama", "Action", "Horror", "Comedy", "Scifi", "Romance"]
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Name of movie", text: $title)
                    Picker("Genre", selection: $genre){
                        ForEach(genres, id: \.self){
                            Text($0)
                        }
                    }
                }
                
                Section{
                    TextEditor(text: $review)
                    Picker("Rating", selection: $rating){
                        ForEach(0..<6){
                            Text(String($0))
                        }
                    }
                } header : {
                    Text("Review")
                }
                
                Section{
                    Button("Save"){
                        let newMovie = Movie(context: moc)
                        newMovie.id = UUID()
                        newMovie.title = title
                        newMovie.rating = Int16(rating)
                        newMovie.genre = genre
                        newMovie.review = review
                        
                        try? moc.save()
                    }
                }
            }
            .navigationTitle("Add Movie")
        }
    }
}

struct AddMovieView_Previews: PreviewProvider {
    static var previews: some View {
        AddMovieView()
    }
}
