//
//  FirestoreExampleApp.swift
//  FirestoreExample
//
//  Created by Tom Huynh on 3/9/24.
//

import SwiftUI
import FirebaseCore

@main
struct FirestoreExampleApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
