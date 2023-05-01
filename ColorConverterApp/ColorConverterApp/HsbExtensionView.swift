//
//  HsbExtensionView.swift
//  ColorConverterApp
//
//  Created by Eric Callanan on 28/04/2023.
//

import SwiftUI

struct HsbExtensionView: View {
    @State var selectedColor: Color = .blue
    var body: some View {
        VStack(alignment: .center) {
            Text("Selecte a Color").font(.title)
            ColorPicker("Select a Color", selection: $selectedColor)
                .frame(width: 200, height: 50)
            Divider()
            
            Text("Color + getHsb()")
                .font(.largeTitle)
                .fontWeight(.heavy)
            Spacer().frame(height: 50)
            
            ColorHueView2(title: "\(selectedColor.description)",
                          color: selectedColor)
            Spacer()
        }
        .padding(40)
    }
}

struct ColorHueView2: View {
    var title: String
    var color: Color
    
    var colorHsb: (CGFloat, CGFloat, CGFloat, CGFloat) {
        color.getHsb()
    }
    var body: some View {
        Text(title)
            .font(.title)
        HStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(color)
                .frame(width: 200, height: 50)
            VStack(alignment: .trailing) {
                Text("Hue: \(colorHsb.0, specifier: "%.3F")")
                Text("Saturation: \(colorHsb.1, specifier: "%.3F")")
                Text("Brightness: \(colorHsb.2, specifier: "%.3F")")
            }
        }
        Divider()
    }
}

struct HsbExtensionView_Previews: PreviewProvider {
    static var previews: some View {
        HsbExtensionView()
    }
}
