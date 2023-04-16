//
//  ContentView.swift
//  CircularSliderWithChatGpt4
//
//  Created by Eric Callanan on 15/04/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack() {
            List {
                Group {
                    NavigationLink (destination: SliderView1(), label: {Text("SliderView  1")})
                    NavigationLink (destination: SliderView2(), label: {Text("SliderView  2")})
                    NavigationLink (destination: SliderView3(), label: {Text("SliderView  3")})
                    NavigationLink (destination: SliderView4(), label: {Text("SliderView  4")})
                    NavigationLink (destination: SliderView5(), label: {Text("SliderView  5")})
                    NavigationLink (destination: SliderView5a(), label: {Text("SliderView  5 - corrected")})
                    NavigationLink (destination: SliderView5b(), label: {Text("SliderView  5 - size")})
                    }
                Group {
                    NavigationLink (destination: SliderView6(), label: {Text("SliderView  6")})
                    NavigationLink (destination: SliderView7(), label: {Text("SliderView  7")})
                    NavigationLink (destination: SliderView8(), label: {Text("SliderView  8")})
                    NavigationLink (destination: SliderView9(), label: {Text("SliderView  9")})
                    NavigationLink (destination: SliderView10(), label: {Text("SliderView 10")})
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
