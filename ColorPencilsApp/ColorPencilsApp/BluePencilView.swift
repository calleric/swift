//
//  BluePencilView.swift
//  ColorPencilsApp
//
//  Created by Eric Callanan on 11/05/2023.
//

import SwiftUI

struct BluePencilView: View {
    var body: some View {
        VStack {
            Text("Blue Pencil")
                .font(.largeTitle)
            
            ColorPencilView1(color: .blue)
                .frame(width: 100, height: 400)
        }
    }
}

struct ColorPencilView1: View {
    var color: Color
    
    var body: some View {
        ZStack {
            PencilTipShape()
                .fill(color)
            PencilTimberShape()
                .fill(Color(hue: 0.07, saturation: 0.4, brightness: 0.9))
            PencilBodyShape()
                .fill(color)
        }
    }
}

struct BluePencilView_Previews: PreviewProvider {
    static var previews: some View {
        BluePencilView()
    }
}
