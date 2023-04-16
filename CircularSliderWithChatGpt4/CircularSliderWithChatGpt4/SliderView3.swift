//
//  SliderView3.swift
//  CircularSliderWithChatGpt4
//
//  Created by Eric Callanan on 15/04/2023.
//

import SwiftUI

struct SliderView3: View {
    var body: some View {
        CircularSlider3()
    }
}

struct SliderView3_Previews: PreviewProvider {
    static var previews: some View {
        SliderView3()
    }
}


struct CircularSlider3: View {
    @State private var sliderValue: CGFloat = 0
    private let maxValue: CGFloat = 100
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.gray, lineWidth: 20)
            
            Circle()
                .trim(from: 0, to: sliderValue / maxValue)
                .stroke(Color.blue, lineWidth: 20)
                .rotationEffect(.degrees(-90))
            
            Text("\(Int(sliderValue))")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Circle()
                .fill(Color.yellow)
                .frame(width: 24, height: 24)
                .offset(y: -130)
                .rotationEffect(.degrees(Double(sliderValue / maxValue * 360 - 90)))
                .gesture(
                    DragGesture(minimumDistance: 0)
                        .onChanged { value in
                            let vector = CGVector(dx: value.location.x - 130, dy: value.location.y - 130)
                            let angle = atan2(vector.dy, vector.dx)
                            let normalizedAngle = angle < 0 ? angle + 2 * .pi : angle
                            sliderValue = max(0, min(maxValue, normalizedAngle * maxValue / (2 * .pi)))
                        }
                )
        }
        .frame(width: 260, height: 260)
    }
}
