//
//  DataController.swift
//  MovieStore
//
//  Created by Tom Huynh on 9/4/22.
//

import CoreData

// Core Data stack manager
struct DataController {
    // Singleton instance for global access
    static let shared = DataController()

    // Persistent container for Core Data
    let container: NSPersistentContainer

    // Initialize the container with the model "MovieDataModel"
    init() {
        container = NSPersistentContainer(name: "MovieDataModel")

        // Load the persistent store and handle errors
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }

        // Automatically merge changes from background contexts
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
}
