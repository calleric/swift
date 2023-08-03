//
//  ColorWithCardsView.swift
//  ColorGradientApp
//
//  Created by Eric Callanan on 19/07/2023.
//

import SwiftUI

struct ColorWithCardsView: View {
    @State private var centerPointIndex = 0
    
    let timer = Timer.publish(every: 3,
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
        .init(x:0.2, y: 0.8),
        .init(x:0.1, y: 0.3),
        .init(x:0.9, y: 0.1),
        .init(x:0.8, y: 0.9)]
    
    let imageList = ["castle1", "mountain4", "mountain1", "mountain2", "mountain3", "castle2", "mountain5"]
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(
                    AngularGradient(colors: oneColor,
                                    center: unitPoints[centerPointIndex])
                )
                .backgroundStyle(.regularMaterial)
                .animation(Animation.easeInOut.speed(0.08),
                           value: centerPointIndex)
                .onReceive(timer) { input in
                    centerPointIndex = (centerPointIndex + 1) % unitPoints.count
                }
                .edgesIgnoringSafeArea(.all)

            Rectangle()
                .fill(.white.opacity(0.5))
                .edgesIgnoringSafeArea(.all)
            
            
            ScrollView {
                VStack(spacing: 30) {
                    ForEach(0..<3, id: \.self) { index in
                        CardView(imageName: imageList[index])
                            .frame(width: 350, height: 200)
                    }
                    Spacer()
                }
                .padding()
            }
        }
    }
}

struct ColorWithCardsView_Previews: PreviewProvider {
    static var previews: some View {
        ColorWithCardsView()
    }
}
