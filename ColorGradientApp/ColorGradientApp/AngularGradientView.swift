//
//  AngularGradientView.swift
//  ColorGradientApp
//
//  Created by Eric Callanan on 19/07/2023.
//

import SwiftUI

struct AngularGradientView: View {
    @State private var centerPointIndex = 0
    
    let timer = Timer.publish(every: 2,
                              on: .main,
                              in: .common).autoconnect()
    
    let oneColor = [Color(hue: 0.01, saturation: 0.2, brightness: 0.9),
                    Color(hue: 0.01, saturation: 1.0, brightness: 0.9)]
    
    let unitPoints: [UnitPoint] = [
        .init(x:0.2, y: 0.8),
        .init(x:0.5, y: 0.2),
        .init(x:0.8, y: 0.9)]
    
    var body: some View {
        VStack {
            Rectangle()
                .fill(
                    AngularGradient(colors: oneColor,
                                    center: unitPoints[centerPointIndex])
                )
                .animation(Animation.easeInOut.speed(0.2),
                           value: centerPointIndex)
                .frame(width: 400, height: 400)
                .onReceive(timer) { input in
                    centerPointIndex = (centerPointIndex + 1) % unitPoints.count
                }
        }
        .padding()
    }
}

struct AngularGradientView_Previews: PreviewProvider {
    static var previews: some View {
        AngularGradientView()
    }
}
