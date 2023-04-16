//
//  SliderView10.swift
//  CircularSliderWithChatGpt4
//
//  Created by Eric Callanan on 15/04/2023.
//

import SwiftUI

struct SliderView10: View {
    @State private var progress: Double = 0
    
    var body: some View {
        CircularProgressView(progress: $progress)
            .frame(width: 200, height: 200)
            .padding()
    }
}

struct SliderView10_Previews: PreviewProvider {
    static var previews: some View {
        SliderView10()
    }
}

struct CircularProgressView: View {
    @Binding var progress: Double
    let circleWidth: CGFloat = 30
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: circleWidth)
                .fill(Color.gray)
            
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                .stroke(lineWidth: circleWidth)
                .fill(Color.blue)
                .rotationEffect(Angle(degrees: -90))
            
            Text("\(Int(progress * 100))")
                .font(.system(size: 50))
                .fontWeight(.bold)
            
            Circle()
                .fill(Color.yellow)
                .frame(width: circleWidth, height: circleWidth)
                .offset(y: -100)
                .rotationEffect(Angle(degrees: 360 * progress - 90))
        }
        .gesture(DragGesture(minimumDistance: 0)
            .onChanged { value in updateProgress(from: value.startLocation, to: value.location) })
    }
    
    private func updateProgress(from startPoint: CGPoint, to endPoint: CGPoint) {
        let width = endPoint.x - startPoint.x
        let height = endPoint.y - startPoint.y
        let distanceFromCenter = sqrt(width * width + height * height)
        
        if distanceFromCenter > 25 && distanceFromCenter < 150 {
            let angle = atan2(height, width)
            let progress = 1.0 - Double(angle / (2 * CGFloat.pi))
            self.progress = (progress + 0.25).truncatingRemainder(dividingBy: 1.0)
        }
    }
}
