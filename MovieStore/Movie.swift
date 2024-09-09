//
//  Movie.swift
//  MovieStore
//
//  Created by Tom Huynh on 9/9/24.
//

import Foundation
import SwiftData

@Model
class Movie {
    var id: UUID
    var title: String
    var genre: String
    var rating: Int16
    var review: String

    init(id: UUID = UUID(), title: String, genre: String, rating: Int16, review: String) {
        self.id = id
        self.title = title
        self.genre = genre
        self.rating = rating
        self.review = review
    }
}
