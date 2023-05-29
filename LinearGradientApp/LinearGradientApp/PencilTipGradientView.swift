//
//  PencilTipGradientView.swift
//  LinearGradientApp
//
//  Created by Eric Callanan on 23/05/2023.
//

import SwiftUI

struct PencilTipGradientView: View {
    let color = Color.blue
    
    var body: some View {
        VStack {
            HStack(spacing: 30) {
                ZStack {
                    PencilTipShape()
                        .fill(getColorGradient(color))
                    PencilTimberShape()
                        .fill(Color(hue: 0.07, saturation: 0.4, brightness: 0.9))
                    PencilBodyShape()
                        .fill(getColorGradient(color))
                }
                .frame(width: 100, height: 600)

                ZStack {
                    Rectangle()
                        .fill(getTipColorGradient(color))
                    PencilTipShape()
                        .stroke(Color.red, lineWidth: 5)
                }
                .frame(width: 100, height: 600)
                
                ZStack {
                    PencilTipShape()
                        .fill(getTipColorGradient(color))
                    PencilTimberShape()
                        .fill(Color(hue: 0.07, saturation: 0.4, brightness: 0.9))
                    PencilBodyShape()
                        .fill(getColorGradient(color))
                }
                .frame(width: 100, height: 600)
            }
        }
    }

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
}

struct PencilTipGradientView_Previews: PreviewProvider {
    static var previews: some View {
        PencilTipGradientView()
    }
}
