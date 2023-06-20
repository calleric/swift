//
//  CircleView.swift
//  AngularGradientApp
//
//  Created by Eric Callanan on 10/06/2023.
//

import SwiftUI

struct CircleView: View {
    @State private var startAngle = Angle(degrees: 0)
    @State private var endAngle = Angle(degrees: 90)
    
    let timer = Timer.publish(every: 2,
                              on: .main,
                              in: .common).autoconnect()
    
    func randomAngles() -> (Angle, Angle) {
        let angle1 = Angle(degrees: Double.random(in: 0...360))
        let angle2 = Angle(degrees: Double.random(in: 0...360))
        return (min(angle1, angle2), max(angle1, angle2))
    }
    
    var body: some View {
        VStack {
            Text("Circle")
                .font(.largeTitle)
                .fontWeight(.bold)
            Text("Anglular Gradient")
                .font(.title)
                .fontWeight(.bold)
            
            Spacer()
                .frame(height: 50)
            
            ZStack {
                Circle()
                    .strokeBorder(Color(hue: 0, saturation: 0, brightness: 0.85),
                                  style: StrokeStyle(lineWidth: 60))
                
                Circle()
                    .trim(from: startAngle.degrees/360.0, to: endAngle.degrees/360.0)
                    .stroke(AngularGradient(colors: AppColors.rainbow,
                                            center: .center,
                                            startAngle: startAngle,
                                            endAngle: endAngle),
                            style: StrokeStyle(lineWidth: 60,
                                               lineCap: .round))
                    .padding(30)
                    .animation(Animation.easeInOut.speed(0.2),
                               value: startAngle)
                    .onReceive(timer) { _ in
                        (startAngle, endAngle) = randomAngles()
                    }
                
                VStack()  {
                    HStack() {
                        Text("Start: ")
                            .font(.title2)
                            .frame(width: 60)
                        Text("\(startAngle.degrees, specifier: "%.0F")")
                            .font(.title)
                            .frame(width: 60)
                            .animation(Animation.easeInOut.speed(0.6),
                                       value: startAngle)
                    }
                    HStack() {
                        Text("End: ")
                            .font(.title2)
                            .frame(width: 60)
                        Text("\(endAngle.degrees, specifier: "%.0F")")
                            .font(.title)
                            .frame(width: 60)
                            .animation(Animation.easeInOut.speed(0.6),
                                       value: endAngle)
                    }
                }
                .padding()
                .fontWeight(.bold)
            }
            .frame(width: 380, height: 380)
            
            
            Spacer()
        }
        .padding()
    }
}


struct CircleView_Previews: PreviewProvider {
    static var previews: some View {
        CircleView()
    }
}
