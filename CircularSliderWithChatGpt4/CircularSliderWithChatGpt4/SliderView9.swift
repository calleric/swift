//
//  SliderView9.swift
//  CircularSliderWithChatGpt4
//
//  Created by Eric Callanan on 15/04/2023.
//

import SwiftUI

struct SliderView9: View {
    var body: some View {
        CircularSlider9()
            .padding()
    }
}

struct SliderView9_Previews: PreviewProvider {
    static var previews: some View {
        SliderView9()
    }
}

struct CircularSlider9: View {
    @State private var sliderValue: Double = 0
    private let maxValue: Double = 100
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.gray, lineWidth: 10)
                .frame(width: 200, height: 200)
            
            Circle()
                .trim(from: 0, to: CGFloat(sliderValue / maxValue))
                .stroke(Color.blue, lineWidth: 10)
                .rotationEffect(Angle(degrees: -90))
                .frame(width: 200, height: 200)
            
            Circle()
                .fill(Color.yellow)
                .frame(width: 20, height: 20)
                .offset(y: -100)
                .rotationEffect(Angle(degrees: (360 * sliderValue / maxValue) - 90))
                .gesture(
                    DragGesture(minimumDistance: 0)
                        .onChanged({ value in
                            let angle = atan2(value.location.y - 100, value.location.x - 100) + .pi
                            sliderValue = max(0, min(maxValue, Double(angle) / (2 * .pi) * maxValue))
                        })
                )
            
            Text("\(Int(sliderValue))")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.black)
        }
    }
}

