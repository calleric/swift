//
//  ColorPencilSetView.swift
//  ColorPencilsApp
//
//  Created by Eric Callanan on 11/05/2023.
//

import SwiftUI

struct ColorPencilSetView: View {
    var body: some View {
        VStack {
            Text("Rainbow Pencil Set")
                .font(.largeTitle)

            HStack {
                ColorPencilView(color: .red)
                ColorPencilView(color: .orange)
                ColorPencilView(color: .yellow)
                ColorPencilView(color: .green)
                ColorPencilView(color: .blue)
                ColorPencilView(color: Color(hue: 0.773, saturation: 1.0, brightness: 0.51))
                ColorPencilView(color: Color(hue: 0.771, saturation: 1.0, brightness: 1.00))
            }
            .frame(width: 400, height: 300)
        }
    }
}

struct ColorPencilSetView_Previews: PreviewProvider {
    static var previews: some View {
        ColorPencilSetView()
    }
}
