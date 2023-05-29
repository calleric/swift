//
//  ColorPencilView.swift
//  LinearGradientApp
//
//  Created by Eric Callanan on 23/05/2023.
//

import SwiftUI

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
    
    func getTipColorGradient(_ col: Color) -> LinearGradient {
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
            startPoint: UnitPoint(x: 0.3, y: 0.13),
            endPoint: UnitPoint(x: 0.7, y: 0.115))
    }
    
    var body: some View {
        ZStack {
            PencilTipShape()
                .fill(getTipColorGradient(color))
            PencilTimberShape()
                .fill(Color(hue: 0.07, saturation: 0.4, brightness: 0.9))
            PencilBodyShape()
                .fill(getColorGradient(color))
        }
    }
}

struct ColorPencilView_Previews: PreviewProvider {
    static var previews: some View {
        ColorPencilView(color: .green)
            .frame(width: 100, height: 600)
    }
}

struct PencilTipShape: Shape {
    func path(in rect: CGRect) -> Path {
        let path = Path { path in
            path.move(to: CGPoint(x: 0.470 * rect.maxX, y: 0.035 * rect.maxY))
            path.addLine(to: CGPoint(x: 0.530 * rect.maxX, y: 0.020 * rect.maxY))
            path.addLine(to: CGPoint(x: 0.670 * rect.maxX, y: 0.106 * rect.maxY))
            path.addCurve(to: CGPoint(x: 0.330 * rect.maxX, y: 0.106 * rect.maxY),
                          control1: CGPoint(x: 0.580 * rect.maxX, y: 0.120 * rect.maxY),
                          control2: CGPoint(x: 0.420 * rect.maxX, y: 0.120 * rect.maxY))
            path.closeSubpath()
        }
        return path
    }
}

struct PencilTimberShape: Shape {
    func path(in rect: CGRect) -> Path {
        let path = Path { path in
            path.move(to: CGPoint(x: 0.330 * rect.maxX, y: 0.106 * rect.maxY))
            path.addCurve(to: CGPoint(x: 0.670 * rect.maxX, y: 0.106 * rect.maxY),
                          control1: CGPoint(x: 0.420 * rect.maxX, y: 0.120 * rect.maxY),
                          control2: CGPoint(x: 0.580 * rect.maxX, y: 0.120 * rect.maxY))
            path.addLine(to: CGPoint(x: 0.980 * rect.maxX, y: 0.270 * rect.maxY))
            path.addCurve(to: CGPoint(x: 0.020 * rect.maxX, y: 0.270 * rect.maxY),
                          control1: CGPoint(x: 0.700 * rect.maxX, y: 0.320 * rect.maxY),
                          control2: CGPoint(x: 0.300 * rect.maxX, y: 0.320 * rect.maxY))
            path.closeSubpath()
        }
        return path
    }
}

struct PencilBodyShape: Shape {
    func path(in rect: CGRect) -> Path {
        let path = Path { path in
            path.move(to: CGPoint(x: 0.020 * rect.maxX, y: 0.270 * rect.maxY))
            path.addCurve(to: CGPoint(x: 0.980 * rect.maxX, y: 0.270 * rect.maxY),
                          control1: CGPoint(x: 0.300 * rect.maxX, y: 0.320 * rect.maxY),
                          control2: CGPoint(x: 0.700 * rect.maxX, y: 0.320 * rect.maxY))
            path.addLine(to: CGPoint(x: 0.980 * rect.maxX, y: 0.900 * rect.maxY))
            path.addCurve(to: CGPoint(x: 0.020 * rect.maxX, y: 0.900 * rect.maxY),
                          control1: CGPoint(x: 0.700 * rect.maxX, y: 0.950 * rect.maxY),
                          control2: CGPoint(x: 0.300 * rect.maxX, y: 0.950 * rect.maxY))
            path.closeSubpath()
        }
        return path
    }
}

