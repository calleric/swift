//
//  ContentView.swift
//  AngularGradientApp
//
//  Created by Eric Callanan on 10/06/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack() {
            List {
                NavigationLink (destination: StartAngularGradientView(), label: {Text("01 Simple angular gradient")})
                NavigationLink (destination: CenterOptionsView(), label: {Text("02 All center options")})
                NavigationLink (destination: FourCornersView(), label: {Text("03 Four corners")})
                NavigationLink (destination: AnimateCenterView(), label: {Text("04 Animate center change")})
                NavigationLink (destination: StartEndAngleView(), label: {Text("05 Setting start and end angles")})
                NavigationLink (destination: AnimateAnglesView(), label: {Text("06 Animate start and end angles")})
                NavigationLink (destination: AnimateCenterAnglesView(), label: {Text("07 Animate center and angles")})
                NavigationLink (destination: CircleView(), label: {Text("08 Angular gradient on a circle")})
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
