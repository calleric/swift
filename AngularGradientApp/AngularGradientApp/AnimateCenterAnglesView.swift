//
//  AnimateCenterAnglesView.swift
//  AngularGradientApp
//
//  Created by Eric Callanan on 10/06/2023.
//

import SwiftUI

struct AnimateCenterAnglesView: View {
    @State private var centerPoint = UnitPoint(x: 0.5, y: 0.5)
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
    
    func randomPoint() -> UnitPoint {
        return UnitPoint(x: Double.random(in: 0...1),
                         y: Double.random(in: 0...1))
    }
    
    var body: some View {
        VStack {
            Text("Move Center & Angles")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Rectangle()
                .fill(
                    AngularGradient(colors: AppColors.rainbow,
                                    center: centerPoint,
                                    startAngle: startAngle,
                                    endAngle: endAngle)
                )
                .animation(Animation.easeInOut.speed(0.2),
                           value: startAngle)
                .frame(width: 400, height: 400)
                .onReceive(timer) { _ in
                    (startAngle, endAngle) = randomAngles()
                    centerPoint = randomPoint()
                }
            
            
            VStack(alignment: .trailing)  {
                HStack() {
                    Spacer()
                    Text("Center: ")
                        .font(.title2)
                    Text("(\(centerPoint.x, specifier: "%.2F"), \(centerPoint.y, specifier: "%.2F"))")
                        .font(.title)
                        .frame(width: 200)
                        .animation(Animation.easeInOut.speed(0.6),
                                   value: centerPoint)
                }
                HStack() {
                    Spacer()
                    Text("Start Angle: ")
                        .font(.title2)
                    Text("\(startAngle.degrees, specifier: "%.0F")")
                        .font(.title)
                        .frame(width: 200)
                        .animation(Animation.easeInOut.speed(0.6),
                                   value: startAngle)
                }
                HStack() {
                    Spacer()
                    Text("End Angle: ")
                        .font(.title2)
                    Text("\(endAngle.degrees, specifier: "%.0F")")
                        .font(.title)
                        .frame(width: 200)
                        .animation(Animation.easeInOut.speed(0.6),
                                   value: endAngle)
                }
            }
            .padding()
            .fontWeight(.bold)
            
            
            Spacer()
        }
        .padding()
    }
}

struct AnimateCenterAnglesView_Previews: PreviewProvider {
    static var previews: some View {
        AnimateCenterAnglesView()
    }
}
