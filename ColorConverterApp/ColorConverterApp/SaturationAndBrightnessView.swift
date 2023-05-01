//
//  SaturationAndBrightnessView.swift
//  ColorConverterApp
//
//  Created by Eric Callanan on 28/04/2023.
//

import SwiftUI

struct SaturationAndBrightnessView: View {
    @State var selectedColor: Color = .blue
    
    var body: some View {
        VStack {
            Text("Selecte a Color").font(.title)
            ColorPicker("", selection: $selectedColor)
                .frame(width: 20, height: 50)
            
            let hsb = selectedColor.getHsb()
            ColorHueView2(title: "Selected HSB", color: selectedColor)
            Text("Adjusting Saturation").font(.title)
            SaturationView(hue: hsb.0, saturation: hsb.1, brightness: hsb.2, alpha: hsb.3)
            Divider()
            Text("Adjusting Brightness").font(.title)
            BrightnessView(hue: hsb.0, saturation: hsb.1, brightness: hsb.2, alpha: hsb.3)
            Spacer()
        }
        .padding(40)
    }
}

struct SaturationView: View {
    var hue: CGFloat
    var saturation: CGFloat
    var brightness: CGFloat
    var alpha: CGFloat = 0.0
    
    var body: some View {
        HStack(spacing: 5) {
            ForEach([1.0, 0.8, 0.6, 0.4, 0.2, 0.1], id: \.self) { factor in
                let adjustedSaturation = saturation * factor
                VStack {
                    RoundedRectangle(cornerRadius: 2)
                        .fill(Color(hue: hue,
                                    saturation: adjustedSaturation,
                                    brightness: brightness,
                                    opacity: alpha))
                        .frame(width: 50, height: 80)
                    
                    Text("\(adjustedSaturation, specifier: "%.2F")")
                        .font(.footnote)
                }
            }
        }
    }
}

struct BrightnessView: View {
    var hue: CGFloat
    var saturation: CGFloat
    var brightness: CGFloat
    var alpha: CGFloat = 0.0
    
    var body: some View {
        HStack(spacing: 5) {
            ForEach([1.0, 0.8, 0.6, 0.4, 0.2, 0.1], id: \.self) { factor in
                let adjustedBrightness = brightness * factor
                VStack {
                    RoundedRectangle(cornerRadius: 2)
                        .fill(Color(hue: hue,
                                    saturation: saturation,
                                    brightness: adjustedBrightness,
                                    opacity: alpha))
                        .frame(width: 50, height: 80)
                    
                    Text("\(adjustedBrightness, specifier: "%.2F")")
                        .font(.footnote)
                }
            }
        }
    }
}


struct SaturationAndBrightnessView_Previews: PreviewProvider {
    static var previews: some View {
        SaturationAndBrightnessView()
    }
}


