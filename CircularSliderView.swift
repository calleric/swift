///
/// CircularSliderView.swift
/// How to create a Circular Slider in SwiftUI
///
/// Xcode version 14.0
/// Swift version 5
///
/// Created by Eric Callanan on 25 / September / 2022.
///
///
/// see more
/// https://swdevnotes.com/swift/2022/create-a-circular-slider-in-swiftui/
///

import SwiftUI

struct ContentView: View {
    @State var progress1 = 0.75
    @State var progress2 = 37.5
    @State var progress3 = 7.5
    
    var body: some View {
        ZStack {
            Color(hue: 0.58, saturation: 0.06, brightness: 1.0)
                .edgesIgnoringSafeArea(.all)

            VStack {
                CircularSliderView_XX(value: $progress1) {
                    Text("\(progress1, specifier: "%.2f")")
                        .font(.system(size: 80, weight: .bold, design:.rounded))
                }
                .frame(width:250, height: 250)
                .padding()
                
                HStack {
                    CircularSliderView_XX(value: $progress2, in: 32...50) {
                        Text("\(progress2, specifier: "%.2f")")
                            .font(.system(size: 40, weight: .bold, design:.rounded))
                    }
                    .padding()

                    CircularSliderView_XX(value: $progress3, in: 0...100) {
                        Text("\(progress3, specifier: "%.2f")")
                            .font(.system(size: 40, weight: .bold, design:.rounded))
                    }
                    .padding()
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CircularSliderView<Content>: View where Content: View {
    @Binding var progress: Double

    @State private var rotationAngle = Angle(degrees: 0)
    private var minValue = 0.0
    private var maxValue = 1.0
    private let label: () -> Content
    
    init(value progress: Binding<Double>, in bounds: ClosedRange<Int> = 0...1, @ViewBuilder label: @escaping () -> Content) {
        self._progress = progress
        
        self.minValue = Double(bounds.first ?? 0)
        self.maxValue = Double(bounds.last ?? 1)
        self.rotationAngle = Angle(degrees: progressFraction * 360.0)
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
    
    var body: some View {
        GeometryReader { gr in
            let radius = (min(gr.size.width, gr.size.height) / 2.0) * 0.9
            let sliderWidth = radius * 0.1
            
            VStack(spacing:0) {
                ZStack {
                    Circle()
                        .stroke(Color(hue: 0.0, saturation: 0.0, brightness: 0.9),
                                style: StrokeStyle(lineWidth: sliderWidth))
                        .overlay() {
                            label()
                        }
                    // uncomment to show tick marks
                    //Circle()
                    //    .stroke(Color(hue: 0.0, saturation: 0.0, brightness: 0.6),
                    //            style: StrokeStyle(lineWidth: sliderWidth * 0.75,
                    //                               dash: [2, (2 * .pi * radius)/24 - 2]))
                    //    .rotationEffect(Angle(degrees: -90))
                    Circle()
                        .trim(from: 0, to: progressFraction)
                        .stroke(Color(hue: 0.0, saturation: 0.5, brightness: 0.9),
                                style: StrokeStyle(lineWidth: sliderWidth, lineCap: .round)
                        )
                        .rotationEffect(Angle(degrees: -90))
                    Circle()
                        .fill(Color.white)
                        .shadow(radius: (sliderWidth * 0.3))
                        .frame(width: sliderWidth, height: sliderWidth)
                        .offset(y: -radius)
                        .rotationEffect(rotationAngle)
                        .gesture(
                            DragGesture(minimumDistance: 0.0)
                                .onChanged() { value in
                                    changeAngle(location: value.location)
                                }
                        )
                }
                .position(x: gr.frame(in: .local).midX,
                          y: gr.frame(in: .local).midY)
                .frame(width: radius * 2.0, height: radius * 2.0, alignment: .center)
            }
            
            .onAppear {
                self.rotationAngle = Angle(degrees: progressFraction * 360.0)
            }
        }
    }
}

