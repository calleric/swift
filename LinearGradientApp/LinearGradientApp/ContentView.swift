//
//  ContentView.swift
//  LinearGradientApp
//
//  Created by Eric Callanan on 23/05/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack() {
            List {
                NavigationLink (destination: StartLinearGradientView(), label: {Text("Start Linear Gradient")})
                NavigationLink (destination: StartEndLinearView(), label: {Text("Various Start & End points")})
                NavigationLink (destination: AllStartEndLinearView(), label: {Text("All Start & End points")})
                NavigationLink (destination: PointCoordinateView(), label: {Text("Coordinates for Start & End points")})
                NavigationLink (destination: PencilTipGradientView(), label: {Text("Coordinates on Pencil Tip Gradient")})
                NavigationLink (destination: BlueColorPencilView(), label: {Text("Blue Color Pencil with tip gradient")})
                NavigationLink (destination: PencilSetView(), label: {Text("Color Pencil Set")})
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
