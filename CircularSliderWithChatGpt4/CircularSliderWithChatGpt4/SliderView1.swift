//
//  SliderView1.swift
//  CircularSliderWithChatGpt4
//
//  Created by Eric Callanan on 15/04/2023.
//

import SwiftUI

struct SliderView1: View {
    @State private var sliderValue: Double = 0
    var body: some View {
        VStack {
            CircularSlider(value: $sliderValue)
            Text("Current Value: \(sliderValue, specifier: "%.2f")")
                .padding()
        }
    }
}

struct SliderView1_Previews: PreviewProvider {
    static var previews: some View {
        SliderView1()
    }
}

struct CircularSlider: View {
    @Binding var value: Double
    private let lineWidth: CGFloat = 20
    private let thumbSize: CGFloat = 30

    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.gray, lineWidth: lineWidth)
            
            Circle()
                .trim(from: 0, to: CGFloat(value / 100))
                .stroke(Color.blue, lineWidth: lineWidth)
                .rotationEffect(.degrees(-90))

            Circle()
                .fill(Color.yellow)
                .frame(width: thumbSize, height: thumbSize)
                .padding(lineWidth / 2)
                .rotationEffect(.degrees(-90 + value * 3.6))
                .gesture(DragGesture(minimumDistance: 0)
                            .onChanged(updateValue(from:)))

            Text("\(value, specifier: "%.0f")")
                .font(.largeTitle)
                .fontWeight(.bold)
        }
    }

    private func updateValue(from drag: DragGesture.Value) {
        let vector = CGVector(dx: drag.location.x - lineWidth - thumbSize / 2, dy: drag.location.y - lineWidth - thumbSize / 2)
        let angle = atan2(vector.dy, vector.dx) + .pi / 2
        let fixedAngle = angle < 0 ? angle + 2 * .pi : angle
        value = Double(fixedAngle / (2 * .pi) * 100)
    }
}

