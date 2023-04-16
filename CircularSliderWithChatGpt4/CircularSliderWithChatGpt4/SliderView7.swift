//
//  SliderView7.swift
//  CircularSliderWithChatGpt4
//
//  Created by Eric Callanan on 15/04/2023.
//

import SwiftUI

struct SliderView7: View {
    var body: some View {
        CircularSlider7()
            .frame(width: 300, height: 300)
    }
}

struct SliderView7_Previews: PreviewProvider {
    static var previews: some View {
        SliderView7()
    }
}

struct CircularSlider7: View {
    @State private var sliderValue: Double = 0
    @GestureState private var dragOffset: CGFloat = 0
    
    var body: some View {
        GeometryReader { geometry in
            let radius = min(geometry.size.width, geometry.size.height) / 2
            let dragGesture = DragGesture()
                .updating($dragOffset) { value, state, _ in
                    state = angleBetweenPoints(radius: radius, center: geometry.frame(in: .local).center, point: value.location)
                }
                .onEnded { value in
                    sliderValue = Double(angleBetweenPoints(radius: radius, center: geometry.frame(in: .local).center, point: value.location)) * 100 / 360
                }
            
            ZStack {
                // Grey background circle
                Circle()
                    .stroke(Color.gray, lineWidth: 20)
                
                // Blue progress circle
                Circle()
                    .trim(from: 0, to: CGFloat(sliderValue / 100))
                    .stroke(Color.blue, lineWidth: 20)
                    .rotationEffect(.degrees(-90))
                
                // Yellow thumb indicator
                Circle()
                    .fill(Color.yellow)
                    .frame(width: 20, height: 20)
                    .offset(x: 0, y: -radius + 10)
                    .rotationEffect(.degrees(-90 + sliderValue * 360 / 100))
                
                // Slider value text
                Text("\(Int(sliderValue))")
                    .font(.system(size: 50, design: .rounded))
            }
            .gesture(dragGesture)
        }
    }
    
    private func angleBetweenPoints(radius: CGFloat, center: CGPoint, point: CGPoint) -> CGFloat {
        let angle = atan2(point.y - center.y, point.x - center.x)
        let degree = angle >= 0 ? Double(angle) : (2 * Double.pi + Double(angle))
        return CGFloat(degree * 180 / Double.pi)
    }
}

extension CGRect {
    var center: CGPoint {
        return CGPoint(x: midX, y: midY)
    }
}
