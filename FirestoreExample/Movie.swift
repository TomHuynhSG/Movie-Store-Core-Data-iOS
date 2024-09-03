//
//  Movie.swift
//  FirestoreExample
//
//  Created by Tom Huynh on 3/9/24.
//

import Foundation

struct Movie: Codable, Identifiable {
    var id: String = UUID().uuidString
    var name: String?
}
