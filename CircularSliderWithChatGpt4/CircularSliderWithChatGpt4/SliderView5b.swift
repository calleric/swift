//
//  SliderView5b.swift
//  CircularSliderWithChatGpt4
//
//  Created by Eric Callanan on 15/04/2023.
//

import SwiftUI

struct SliderView5b: View {
    var body: some View {
        VStack(spacing: 40) {
            CircularSlider5b(size: 100)
            CircularSlider5b(size: 200)
            CircularSlider5b(size: 300)
        }
    }
}

struct SliderView5b_Previews: PreviewProvider {
    static var previews: some View {
        SliderView5b()
    }
}

struct CircularSlider5b: View {
    @State private var sliderValue: Double = 0
    private let sliderRange = 0.0...100.0
    let size: CGFloat
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.gray, lineWidth: size * 0.067)
            
            Circle()
                .trim(from: 0, to: CGFloat(sliderValue / 100))
                .stroke(Color.blue, lineWidth: size * 0.067)
                .rotationEffect(.degrees(-90))
            
            Circle()
                .fill(Color.yellow)
                .frame(width: size * 0.1, height: size * 0.1)
                .offset(y: -size * 0.5)
                .rotationEffect(.degrees(sliderValue * 3.6))
            
            Text("\(Int(sliderValue))")
                .font(.system(size: size * 0.2))
                .fontWeight(.bold)
        }
        .frame(width: size, height: size)
        .gesture(
            DragGesture(minimumDistance: 0)
                .onChanged { value in
                    let vector = CGVector(dx: value.location.x - size / 2, dy: value.location.y - size / 2)
                    let angle = atan2(vector.dy, vector.dx) + .pi / 2
                    let value = angle >= 0 ? angle : angle + 2 * .pi
                    sliderValue = max(sliderRange.lowerBound, min(sliderRange.upperBound, Double(value) * 100 / (2 * .pi)))
                }
        )
    }
}
