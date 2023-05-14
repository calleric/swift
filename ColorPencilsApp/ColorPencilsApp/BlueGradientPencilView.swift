//
//  BlueGradientPencilView.swift
//  ColorPencilsApp
//
//  Created by Eric Callanan on 11/05/2023.
//

import SwiftUI

struct BlueGradientPencilView: View {
    var body: some View {
        VStack {
            Text("Blue Pencil")
                .font(.largeTitle)
            Text("Color gradient")
                .font(.title)

            HStack {
                ColorPencilView(color: .blue)
                    .frame(width: 100, height: 400)
            }
        }
    }
}

struct ColorPencilView: View {
    var color: Color
    
    func getColorGradient(_ col: Color) -> LinearGradient {
        var hue: CGFloat  = 0.0
        var saturation: CGFloat = 0.0
        var brightness: CGFloat = 0.0
        var alpha: CGFloat = 0.0
        
        let uiColor = UIColor(col)
        uiColor.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
        
        return LinearGradient(
            colors: [
                Color(hue: hue, saturation: saturation * 1.0, brightness: brightness * 0.4),
                Color(hue: hue, saturation: saturation * 1.0, brightness: brightness * 0.8),
                Color(hue: hue, saturation: saturation * 1.0, brightness: brightness * 1.0),
                Color(hue: hue, saturation: saturation * 0.6, brightness: brightness * 1.0),
                Color(hue: hue, saturation: saturation * 0.8, brightness: brightness * 0.9)
            ],
            startPoint: .leading,
            endPoint: .trailing)
    }
    
    var body: some View {
        ZStack {
            PencilTipShape()
                .fill(getColorGradient(color))
            PencilTimberShape()
                .fill(Color(hue: 0.07, saturation: 0.4, brightness: 0.9))
            PencilBodyShape()
                .fill(getColorGradient(color))
        }
    }
}


struct BlueGradientPencilView_Previews: PreviewProvider {
    static var previews: some View {
        BlueGradientPencilView()
    }
}
