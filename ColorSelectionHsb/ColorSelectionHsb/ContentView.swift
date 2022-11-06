//
//  ContentView.swift
//  ColorSelectionHsb
//
//  Created by Eric Callanan on 06/11/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView() {
            List {
                NavigationLink (destination: RgbColorPaletteView(), label: {Text("RgbColorPaletteView")})
                NavigationLink (destination: HsbColorPaletteView(), label: {Text("HsbColorPaletteView")})
                NavigationLink (destination: ChangeHsbView(), label: {Text("ChangeHsbView")})
                NavigationLink (destination: ColorWheelView(), label: {Text("ColorWheelView")})
                NavigationLink (destination: MatchingColorView(), label: {Text("MatchingColorView")})
                NavigationLink (destination: HueCircularSliderDisplayView(), label: {Text("HueCircularSliderDisplayView")})
                NavigationLink (destination: ThumbView(), label: {Text("ThumbView")})
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
