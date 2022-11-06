//
//  CircularSliderView.swift
//  ColorSelectionHsb
//
//  Created by Eric Callanan on 06/11/2022.
//

import SwiftUI

struct HueCircularSliderDisplayView: View {
    @State var progress = 120.0
    
    var body: some View {
        VStack {
            CircularSliderView(value: $progress, in: 0...360)
        }
    }
}

struct CircularSliderView: View {
    @Binding var progress: Double
    
    @State private var rotationAngle = Angle(degrees: 0)
    private var minValue = 0.0
    private var maxValue = 1.0
    
    init(value progress: Binding<Double>, in bounds: ClosedRange<Int> = 0...1) {
        self._progress = progress
        
        self.minValue = Double(bounds.first ?? 0)
        self.maxValue = Double(bounds.last ?? 1)
        self.rotationAngle = Angle(degrees: progressFraction * 360.0)
    }
    
    var body: some View {
        GeometryReader { gr in
            let radius = (min(gr.size.width, gr.size.height) / 2.0) * 0.9
            let sliderWidth = radius * 0.3
            
            VStack(spacing:0) {
                ZStack {
                    Circle()
                        .strokeBorder(hueAngularGradient,
                                      style: StrokeStyle(lineWidth: sliderWidth))
                        .rotationEffect(Angle(degrees: -90))
                        .overlay() {
                            Text("\(progress, specifier: "%.0f")")
                                .font(.system(size: radius * 0.5, weight: .bold, design:.rounded))
                        }
                    Circle()
                        .fill(Color.white)
                        .shadow(radius: (sliderWidth * 0.3))
                        .frame(width: sliderWidth, height: sliderWidth)
                        .offset(y: -(radius - (sliderWidth * 0.5)))
                        .rotationEffect(rotationAngle)
                        .gesture(
                            DragGesture(minimumDistance: 0.0)
                                .onChanged() { value in
                                    changeAngle(location: value.location)
                                }
                        )
                }
                .frame(width: radius * 2.0, height: radius * 2.0, alignment: .center)
                .padding(radius * 0.1)
            }
            .onAppear {
                self.rotationAngle = Angle(degrees: progressFraction * 360.0)
            }
        }
    }
    
    private var progressFraction: Double {
        return ((progress - minValue) / (maxValue - minValue))
    }
    
    private func changeAngle(location: CGPoint) {
        // Create a Vector for the location (reversing the y-coordinate system on iOS)
        let vector = CGVector(dx: location.x, dy: -location.y)
        
        // Calculate the angle of the vector
        let angleRadians = atan2(vector.dx, vector.dy)
        
        // Convert the angle to a range from 0 to 360 (rather than having negative angles)
        let positiveAngle = angleRadians < 0.0 ? angleRadians + (2.0 * .pi) : angleRadians
        
        // Update slider progress value based on angle
        progress = ((positiveAngle / (2.0 * .pi)) * (maxValue - minValue)) + minValue
        rotationAngle = Angle(radians: positiveAngle)
    }
    
    let hueAngularGradient = AngularGradient(
        gradient: Gradient(colors: [
            Color(hue: 0.0, saturation: 1.0, brightness: 1.0),
            Color(hue: 0.1, saturation: 1.0, brightness: 1.0),
            Color(hue: 0.2, saturation: 1.0, brightness: 1.0),
            Color(hue: 0.3, saturation: 1.0, brightness: 1.0),
            Color(hue: 0.4, saturation: 1.0, brightness: 1.0),
            Color(hue: 0.5, saturation: 1.0, brightness: 1.0),
            Color(hue: 0.6, saturation: 1.0, brightness: 1.0),
            Color(hue: 0.7, saturation: 1.0, brightness: 1.0),
            Color(hue: 0.8, saturation: 1.0, brightness: 1.0),
            Color(hue: 0.9, saturation: 1.0, brightness: 1.0),
            Color(hue: 1.0, saturation: 1.0, brightness: 1.0),
        ]),
        center: .center,
        startAngle: .degrees(0),
        endAngle: .degrees(360.0))
}


struct HueCircularSliderDisplayView_Previews: PreviewProvider {
    static var previews: some View {
        HueCircularSliderDisplayView()
    }
}
