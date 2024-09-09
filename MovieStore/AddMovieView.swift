//
//  AddMovieView.swift
//  MovieStore
//
//  Created by Tom Huynh on 9/4/22.
//

import SwiftUI

struct AddMovieView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
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
                    
                    //Complex version with star image
                    RatingStarsView(rating: $rating)
                    
                    /*: Simple version without star image
                    Picker("Rating", selection: $rating){
                        Simple version without star image
                        ForEach(0..<6){
                            Text(String($0))
                        }
                    } */
                    
                } header : {
                    Text("Review")
                }
                
                Section{
                    Button("Save"){
                        let newMovie = Movie(title: title, genre: genre, rating: Int16(rating), review: review)
                        
                        modelContext.insert(newMovie)
                        dismiss()
                    }
                }
            }
            .navigationTitle("Add Movie")
        }
    }
}

#Preview {
    AddMovieView()
}
