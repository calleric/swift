//
//  ContentView.swift
//  MathewEffectApp
//
//  Created by Eric Callanan on 27/09/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView() {
            List {
                NavigationLink (destination: ScenarioOneView(), label: {Text("01 ScenarioOneView")})
                NavigationLink (destination: ScenarioTwoView(), label: {Text("02 ScenarioTwoView")})
                NavigationLink (destination: ScenarioThreeView(), label: {Text("03 ScenarioThreeView")})
                NavigationLink (destination: ScenarioFourView(), label: {Text("04 ScenarioFourView")})
            }
            .navigationTitle("Matthews Effect")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
