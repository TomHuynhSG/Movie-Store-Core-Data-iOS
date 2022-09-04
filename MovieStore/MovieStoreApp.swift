//
//  MovieStoreApp.swift
//  MovieStore
//
//  Created by Tom Huynh on 9/4/22.
//

import SwiftUI

@main
struct MovieStoreApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
