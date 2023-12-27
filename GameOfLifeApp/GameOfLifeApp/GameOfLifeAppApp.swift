//
//  GameOfLifeAppApp.swift
//  GameOfLifeApp
//
//  Created by Eric Callanan on 20/12/2023.
//

import SwiftUI

@main
struct GameOfLifeAppApp: App {
    
    /// The app's state.
    @State private var lifeViewModel = LifeViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(lifeViewModel)
        }
    }
}
