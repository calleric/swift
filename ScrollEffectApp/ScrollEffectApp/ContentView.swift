//
//  ContentView.swift
//  ScrollEffectApp
//
//  Created by Eric Callanan on 03/01/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack() {
            List {
                NavigationLink (destination: NoTransitionView(), label: {Text("01 No Scroll Transition")})
                NavigationLink (destination: ScaleTransitionView(), label: {Text("02 Scale Transition")})
                NavigationLink (destination: OpacityTransitionView(), label: {Text("03 Opacity Transition")})
                NavigationLink (destination: OffsetTransitionView(), label: {Text("04 Offset Transition")})
                NavigationLink (destination: ScaleOpacityView(), label: {Text("05 Scale and Opacity")})
                NavigationLink (destination: ViewAlignedView(), label: {Text("06 View Aligned")})
                NavigationLink (destination: ScaleOpacityRotationView(), label: {Text("07 Sale, Opacity and Rotation")})
                NavigationLink (destination: PerspectiveView(), label: {Text("08 Perspective")})
            }
        }
    }
}

#Preview {
    ContentView()
}
