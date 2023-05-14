//
//  ContentView.swift
//  ColorPencilsApp
//
//  Created by Eric Callanan on 11/05/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack() {
            List {
                NavigationLink (destination: GrayPencilView(), label: {Text("Gray Pencil")})
                NavigationLink (destination: BluePencilView(), label: {Text("Blue Pencil")})
                NavigationLink (destination: BlueGradientPencilView(), label: {Text("Color Gradient Pencil")})
                NavigationLink (destination: ColorPencilSetView(), label: {Text("Pencil Set")})
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
