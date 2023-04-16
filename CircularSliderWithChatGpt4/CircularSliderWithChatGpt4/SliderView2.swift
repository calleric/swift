//
//  SliderView2.swift
//  CircularSliderWithChatGpt4
//
//  Created by Eric Callanan on 15/04/2023.
//

import SwiftUI

struct SliderView2: View {
    var body: some View {
        CircularSlider2()
            .padding()
    }
}

struct SliderView2_Previews: PreviewProvider {
    static var previews: some View {
        SliderView2()
    }
}


struct CircularSlider2: View {
    @State private var sliderValue: CGFloat = 0
    @State private var angle: Double = 0
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.gray, lineWidth: 20)
                .frame(width: 200, height: 200)
            
            Circle()
                .trim(from: 0, to: sliderValue / 100)
                .stroke(Color.blue, lineWidth: 20)
                .frame(width: 200, height: 200)
                .rotationEffect(.degrees(-90))
            
            Circle()
                .fill(Color.yellow)
                .frame(width: 30, height: 30)
                .offset(y: -100)
                .rotationEffect(Angle.degrees(Double(sliderValue / 100 * 360 - 90)))
                .gesture(
                    DragGesture(minimumDistance: 0)
                        .onChanged { value in
                            let vector = CGVector(dx: value.location.x - 100, dy: value.location.y - 100)
                            let angle = atan2(vector.dy, vector.dx)
                            let degree = Double(angle) * 180 / .pi
                            let newValue = (degree + 90) * 100 / 360
                            sliderValue = CGFloat(max(min(newValue, 100), 0))
                        }
                )
            
            Text("\(Int(sliderValue))")
                .font(.system(size: 50, weight: .bold, design: .rounded))
                .foregroundColor(.blue)
        }
    }
}
