//
//  SliderView6.swift
//  CircularSliderWithChatGpt4
//
//  Created by Eric Callanan on 15/04/2023.
//

import SwiftUI

struct SliderView6: View {
    var body: some View {
        CircularSlider6()
            .padding()
    }
}

struct SliderView6_Previews: PreviewProvider {
    static var previews: some View {
        SliderView6()
    }
}

struct CircularSlider6: View {
    @State private var currentValue: CGFloat = 0
    
    var body: some View {
        GeometryReader { geometry in
            let radius = min(geometry.size.width, geometry.size.height) / 2
            
            ZStack {
                Circle()
                    .stroke(Color.gray, lineWidth: 10)
                
                Circle()
                    .trim(from: 0, to: currentValue / 100)
                    .stroke(Color.blue, lineWidth: 10)
                    .rotationEffect(.degrees(-90))
                
                Circle()
                    .fill(Color.yellow)
                    .frame(width: 20, height: 20)
                    .offset(x: 0, y: -radius + 10)
                    .rotationEffect(.degrees(Double(currentValue / 100) * 360 - 90))
                    .gesture(
                        DragGesture(minimumDistance: 0)
                            .onChanged { value in
                                let vector = CGVector(dx: value.location.x - geometry.size.width / 2, dy: value.location.y - geometry.size.height / 2)
                                let angle = atan2(vector.dy, vector.dx) + .pi / 2
                                let fixedAngle = angle < 0 ? angle + 2 * .pi : angle
                                currentValue = min(max(0, fixedAngle / (2 * .pi) * 100), 100)
                            }
                    )
                
                Text("\(Int(currentValue))")
                    .font(.system(size: 50))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
            }
        }
        .aspectRatio(1, contentMode: .fit)
    }
}
