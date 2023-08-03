//
//  ColorBackgroundView.swift
//  ColorGradientApp
//
//  Created by Eric Callanan on 19/07/2023.
//

import SwiftUI

struct ColorBackgroundView: View {
    @State private var centerPointIndex = 0
    
    let timer = Timer.publish(every: 2,
                              on: .main,
                              in: .common).autoconnect()
    
    let oneColor = [Color(hue: 285.0/360.0, saturation: 0.7, brightness: 1.0),
                    Color(hue: 285.0/360.0, saturation: 0.9, brightness: 1.0),
                    Color(hue: 285.0/360.0, saturation: 0.7, brightness: 1.0),
                    Color(hue: 285.0/360.0, saturation: 0.9, brightness: 1.0),
                    Color(hue: 285.0/360.0, saturation: 0.7, brightness: 1.0),
                    Color(hue: 285.0/360.0, saturation: 0.9, brightness: 1.0),
                    Color(hue: 285.0/360.0, saturation: 0.7, brightness: 1.0)]
  
    let unitPoints: [UnitPoint] = [
        .init(x:0.2, y: 0.6),
        .init(x:0.1, y: 0.4),
        .init(x:0.9, y: 0.3),
        .init(x:0.8, y: 0.65)]

//    let unitPoints: [UnitPoint] = [
//        .init(x:0.2, y: 0.8),
//        .init(x:0.1, y: 0.3),
//        .init(x:0.9, y: 0.1),
//        .init(x:0.8, y: 0.9)]
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(
                    AngularGradient(colors: oneColor,
                                    center: unitPoints[centerPointIndex])
                )
                .backgroundStyle(.regularMaterial)
                .animation(Animation.easeInOut.speed(0.18),
                           value: centerPointIndex)
                .onReceive(timer) { input in
                    centerPointIndex = (centerPointIndex + 1) % unitPoints.count
                }
                .edgesIgnoringSafeArea(.all)

            Rectangle()
                .fill(.white.opacity(0.5))
                .edgesIgnoringSafeArea(.all)
        }
    }
}

struct ColorBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        ColorBackgroundView()
    }
}
