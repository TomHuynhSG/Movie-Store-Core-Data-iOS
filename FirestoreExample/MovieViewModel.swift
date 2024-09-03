//
//  MovieViewModel.swift
//  FirestoreExample
//
//  Created by Tom Huynh on 3/9/24.
//

import Foundation
import FirebaseFirestore

class MovieViewModel: ObservableObject {
    @Published var movies = [Movie]()

    private var db = Firestore.firestore()
    
    init() {
            getAllMovieData()
    }
    
    func getAllMovieData() {
        
        // Retrieve the "movies" document
        db.collection("movies").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            // Loop to get the "name" field inside each movie document
            self.movies = documents.map { (queryDocumentSnapshot) -> Movie in
                let data = queryDocumentSnapshot.data()
                let name = data["name"] as? String ?? ""
                return Movie(name: name)
            }
        }
    }

    func addNewMovieData(name: String) {
        // add a new document of a movie name in the "movies" collection
        db.collection("movies").addDocument(data: ["name": name])
    }

}
