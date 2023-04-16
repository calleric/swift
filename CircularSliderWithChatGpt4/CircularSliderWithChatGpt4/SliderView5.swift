//
//  SliderView5.swift
//  CircularSliderWithChatGpt4
//
//  Created by Eric Callanan on 15/04/2023.
//

import SwiftUI

struct SliderView5: View {
    var body: some View {
        CircularSlider5()
    }
}

struct SliderView5_Previews: PreviewProvider {
    static var previews: some View {
        SliderView5()
    }
}

struct CircularSlider5: View {
    @State private var sliderValue: Double = 0
    private let sliderRange = 0.0...100.0

    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.gray, lineWidth: 20)
            
            Circle()
                .trim(from: 0, to: CGFloat(sliderValue / 100))
                .stroke(Color.blue, lineWidth: 20)
                .rotationEffect(.degrees(-90))
            
            Circle()
                .fill(Color.yellow)
                .frame(width: 30, height: 30)
                .offset(y: -150)
                .rotationEffect(.degrees(-90 + sliderValue * 3.6))

            Text("\(Int(sliderValue))")
                .font(.largeTitle)
                .fontWeight(.bold)
        }
        .frame(width: 300, height: 300)
        .gesture(
            DragGesture(minimumDistance: 0)
                .onChanged { value in
                    let vector = CGVector(dx: value.location.x - 150, dy: value.location.y - 150)
                    let angle = atan2(vector.dy, vector.dx) + .pi / 2
                    let value = angle >= 0 ? angle : angle + 2 * .pi
                    sliderValue = max(sliderRange.lowerBound, min(sliderRange.upperBound, Double(value) * 100 / (2 * .pi)))
                }
        )
    }
}
