//
//  ThumbView.swift
//  ColorGradientApp
//
//  Created by Eric Callanan on 19/07/2023.
//

import SwiftUI

struct ThumbView: View {
    let oneColor = [Color(hue: 285.0/360.0, saturation: 0.2, brightness: 1.0),
                    Color(hue: 285.0/360.0, saturation: 0.4, brightness: 1.0),
                    Color(hue: 285.0/360.0, saturation: 0.2, brightness: 1.0),
                    Color(hue: 285.0/360.0, saturation: 0.4, brightness: 1.0),
                    Color(hue: 285.0/360.0, saturation: 0.2, brightness: 1.0),
                    Color(hue: 285.0/360.0, saturation: 0.4, brightness: 1.0),
                    Color(hue: 285.0/360.0, saturation: 0.2, brightness: 1.0)]
    var body: some View {
        ZStack {
            Rectangle()
                .fill(
                    AngularGradient(colors: oneColor,
                                    center: UnitPoint(x: 0.8, y: 0.3))
                )
                .backgroundStyle(.regularMaterial)
                .edgesIgnoringSafeArea(.all)
            
            Rectangle()
                .fill(.white.opacity(0.5))
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(0..<3, id: \.self) { index in
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.orange.opacity(0.9))
                            .frame(width: 150, height: 60)
                    }
                    Spacer()
                }
                .padding(150)
            }
        }
    }
}

struct ThumbView_Previews: PreviewProvider {
    static var previews: some View {
        ThumbView()
    }
}
