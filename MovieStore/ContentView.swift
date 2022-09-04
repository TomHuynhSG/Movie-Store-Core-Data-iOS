//
//  ContentView.swift
//  MovieStore
//
//  Created by Tom Huynh on 9/4/22.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var movies: FetchedResults<Movie>
    
    @State private var showingAddScreen = false
    
    var body: some View {
        NavigationView{
            Text("Count: \(movies.count)")
                .navigationTitle("Movie Store")
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button {
                            showingAddScreen.toggle()
                        } label: {
                            Label("Add Movie", systemImage: "plus")
                        }
                    }
                }
                .sheet(isPresented: $showingAddScreen){
                    AddMovieView()
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
