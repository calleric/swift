//
//  ContentView.swift
//  ColorGradientApp
//
//  Created by Eric Callanan on 19/07/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack() {
            List {
                NavigationLink (destination: AngularGradientView(), label: {Text("01 Angular Gradient")})
                NavigationLink (destination: FullBackgroundView(), label: {Text("02 Full background")})
                NavigationLink (destination: PurpleBackgroundView(), label: {Text("03 Purple background")})
                NavigationLink (destination: MaterialBackgroundView(), label: {Text("04 Material background")})
                NavigationLink (destination: ColorBackgroundView(), label: {Text("05 Color background")})
                NavigationLink (destination: MaterialCardsView(), label: {Text("06 Material background with Cards")})
                NavigationLink (destination: ColorWithCardsView(), label: {Text("07 White color background with Cards")})
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
