//
//  SliderView4.swift
//  CircularSliderWithChatGpt4
//
//  Created by Eric Callanan on 15/04/2023.
//

import SwiftUI

struct SliderView4: View {
    var body: some View {
        CircularSlider4()
            .padding()
    }
}

struct SliderView4_Previews: PreviewProvider {
    static var previews: some View {
        SliderView4()
    }
}


struct CircularSlider4: View {
    @State private var sliderValue: Double = 0
    @State private var angle: Angle = .degrees(0)
    let circleWidth: CGFloat = 10
    let thumbRadius: CGFloat = 15

    var body: some View {
        GeometryReader { geometry in
            let circleRadius = min(geometry.size.width, geometry.size.height) / 2 - thumbRadius
            let circleCenter = CGPoint(x: geometry.size.width / 2, y: geometry.size.height / 2)

            ZStack {
                // Background circle
                Circle()
                    .stroke(Color.gray, lineWidth: circleWidth)

                // Progress circle
                Circle()
                    .trim(from: 0, to: CGFloat(sliderValue / 100))
                    .stroke(Color.blue, lineWidth: circleWidth)
                    .rotationEffect(Angle.degrees(-90))

                // Thumb indicator
                Circle()
                    .fill(Color.yellow)
                    .frame(width: thumbRadius * 2, height: thumbRadius * 2)
                    .position(x: circleCenter.x + circleRadius * cos(CGFloat(angle.radians - Double.pi / 2)),
                              y: circleCenter.y + circleRadius * sin(CGFloat(angle.radians - Double.pi / 2)))

                // Current value text
                Text("\(Int(sliderValue))")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.blue)
            }
            .gesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { value in
                        let angleInRadians = atan2(value.location.y - circleCenter.y, value.location.x - circleCenter.x)
                        angle = Angle(radians: Double(angleInRadians) + Double.pi / 2)

                        let percent = (angle.degrees + 90) / 360
                        sliderValue = max(min(percent * 100, 100), 0)
                    }
            )
        }
        .aspectRatio(1, contentMode: .fit)
    }
}
