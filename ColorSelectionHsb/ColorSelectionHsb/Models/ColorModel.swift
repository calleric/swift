//
//  ColorModel.swift
//  ColorSelectionHsb
//
//  Created by Eric Callanan on 06/11/2022.
//

import SwiftUI

struct ColorModel {
    var hueDegrees: Double
    private var sat: Double
    private var bright: Double

    let totalDegrees = 360.0
    
    init(hueDegrees: Double, sat: Double, bright: Double) {
        self.hueDegrees = hueDegrees
        self.sat = sat
        self.bright = bright
    }
    
    init() {
        self.init(hueDegrees: 0, sat: 1.0, bright: 1.0)
    }
    
    var hueDouble: Double {
        return Double(self.hueDegrees) / totalDegrees
    }

    var color: Color {
        return Color(hue: hueDouble, saturation: sat, brightness: bright)
    }
    
    // Monochromatic
    var monochromaticColors: [Color] {
        return [
            Color(hue: hueDouble, saturation: sat, brightness: bright),
            Color(hue: hueDouble, saturation: (sat * 0.8), brightness: bright),
            Color(hue: hueDouble, saturation: (sat * 0.6), brightness: bright),
            Color(hue: hueDouble, saturation: (sat * 0.4), brightness: bright)
        ]
    }
    
    private func adjustHue(_ value: Double, percent adjustment: Double) -> Double {
        return Double((Int((value * 100) + adjustment)) % 100) / 100.0
    }
    
    // Analogous
    var analogousColors: [Color] {
        let hue1 = adjustHue(hueDouble, percent: 4)
        let hue2 = adjustHue(hueDouble, percent: -4)
        return [
            Color(hue: hueDouble, saturation: sat, brightness: bright),
            Color(hue: hue1, saturation: sat, brightness: bright),
            Color(hue: hue2, saturation: sat, brightness: bright)
        ]
    }

    // Complementary
    var complementaryColors: [Color] {
        let hue1 = adjustHue(hueDouble, percent: 50)
        return [
            Color(hue: hueDouble, saturation: sat, brightness: bright),
            Color(hue: hue1, saturation: sat, brightness: bright)
        ]
    }
    
    // Triadic
    var triadicColors: [Color] {
        let hue1 = adjustHue(hueDouble, percent: 33.33)
        let hue2 = adjustHue(hueDouble, percent: 66.66)
        return [
            Color(hue: hueDouble, saturation: sat, brightness: bright),
            Color(hue: hue1, saturation: sat, brightness: bright),
            Color(hue: hue2, saturation: sat, brightness: bright)
        ]
    }
}
