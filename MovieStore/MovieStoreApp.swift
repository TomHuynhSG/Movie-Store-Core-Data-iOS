//
//  MovieStoreApp.swift
//  MovieStore
//
//  Created by Tom Huynh on 9/4/22.
//

import SwiftUI
import SwiftData

@main
struct MovieStoreApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Movie.self)
        }
     }
}



