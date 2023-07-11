//
//  ContentView.swift
//  RadialGradientApp
//
//  Created by Eric Callanan on 08/07/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack() {
            List {
                NavigationLink (destination: StartRadialGradientView(), label: {Text("01 Start Radial Gradient")})
                NavigationLink (destination: CenterOptionsView(), label: {Text("02 All Center Options")})
                NavigationLink (destination: AnimateCenterView(), label: {Text("03 Animate move center point")})
                NavigationLink (destination: StartEndRadiusView(), label: {Text("04 Start & end radius settings")})
                NavigationLink (destination: AnimateRadiiView(), label: {Text("05 Animate start & end radii")})
                NavigationLink (destination: AnimateCenterRadiiView(), label: {Text("06 Animate center, start & end radii")})
                NavigationLink (destination: HypnoticView(), label: {Text("07 Hypnotic")})
                NavigationLink (destination: RainbowView(), label: {Text("08 Rainbow")})
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
