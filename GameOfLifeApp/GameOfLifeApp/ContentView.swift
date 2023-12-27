//
//  ContentView.swift
//  GameOfLifeApp
//
//  Created by Eric Callanan on 20/12/2023.
//

import SwiftUI

struct ContentView: View {
    @Environment(LifeViewModel.self) private var lifeViewModel
    
    var body: some View {
        NavigationStack() {
            List {
                NavigationLink (destination: GridLayoutView(), label: {Text("01 Use Grid")})
                NavigationLink (destination: GridFromArrayView(), label: {Text("02 Grid from 2D Array")})
                NavigationLink (destination: CanvasLayoutView(), label: {Text("03 Use Canvas")})
                NavigationLink (destination: CanvasFromArrayView(), label: {Text("04 Canvas from 2D Array")})
                NavigationLink (destination: CanvasFromModelView(), label: {Text("05 Canvas from Model")})
                NavigationLink (destination: GameOfLifeView(gridSize: 20), label: {Text("06 GameOfLifeView")})
            }
        }
    }
}

#Preview {
    ContentView().environment(LifeViewModel())
}
