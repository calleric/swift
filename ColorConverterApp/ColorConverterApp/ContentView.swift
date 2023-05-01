//
//  ContentView.swift
//  ColorConverterApp
//
//  Created by Eric Callanan on 28/04/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack() {
            List {
                NavigationLink (destination: DescriptionView(), label: {Text("Color Description")})
                NavigationLink (destination: GetHueView(), label: {Text("UIColor - getHue")})
                NavigationLink (destination: GetRedView(), label: {Text("UIColor - getRed")})
                NavigationLink (destination: HsbExtensionView(), label: {Text("getHSB Extension")})
                NavigationLink (destination: SaturationAndBrightnessView(), label: {Text("Adjust Saturation & Brightness")})
                NavigationLink (destination: ThumbView(), label: {Text("10 ThumbView")})
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
