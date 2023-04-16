//
//  SliderView8.swift
//  CircularSliderWithChatGpt4
//
//  Created by Eric Callanan on 15/04/2023.
//

import SwiftUI

struct SliderView8: View {
    @State private var sliderValue: Double = 0
    
    var body: some View {
        VStack {
            CircularSlider8(value: $sliderValue)
        }
    }
}

struct SliderView8_Previews: PreviewProvider {
    static var previews: some View {
        SliderView8()
    }
}


struct CircularSlider8: View {
    @Binding var value: Double
    let startAngle: Double = -90
    let lineWidth: CGFloat = 10
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.gray, style: StrokeStyle(lineWidth: lineWidth))
            
            Circle()
                .trim(from: 0, to: CGFloat(value / 100))
                .stroke(Color.blue, style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
                .rotationEffect(Angle(degrees: startAngle))
            
            Circle()
                .fill(Color.yellow)
                .frame(width: lineWidth * 2, height: lineWidth * 2)
                .offset(y: -lineWidth * 5)
                .rotationEffect(Angle(degrees: startAngle + value * 360 / 100))
            
            Text(String(format: "%.0f", value))
                .font(.system(size: 60))
                .fontWeight(.bold)
                .foregroundColor(.black)
        }
        .frame(width: lineWidth * 10, height: lineWidth * 10)
        .gesture(DragGesture(minimumDistance: 0)
                    .onChanged { gesture in
                        let angle = calculateAngle(from: gesture.location)
                        value = Double(angle + 90) / 360 * 100
                    })
    }
    
    private func calculateAngle(from point: CGPoint) -> Double {
        let center = CGPoint(x: lineWidth * 5, y: lineWidth * 5)
        let angle = atan2(point.y - center.y, point.x - center.x) * 180 / .pi
        return angle < 0 ? angle + 360 : angle
    }
}
