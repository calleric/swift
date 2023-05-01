//
//  Color+Hsb+Rgb.swift
//  ColorConverterApp
//
//  Created by Eric Callanan on 28/04/2023.
//

import SwiftUI

extension Color {
    func getHsb() -> (CGFloat, CGFloat, CGFloat, CGFloat) {
        var hue: CGFloat  = 0.0
        var saturation: CGFloat = 0.0
        var brightness: CGFloat = 0.0
        var alpha: CGFloat = 0.0
        
        let uiColor = UIColor(self)
        uiColor.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
        
        return (hue, saturation, brightness, alpha)
    }
    
    func getRgb() -> (CGFloat, CGFloat, CGFloat, CGFloat) {
        var red: CGFloat  = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        var alpha: CGFloat = 0.0

        let uiColor = UIColor(self)
        uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        return (red, green, blue, alpha)
    }
}
