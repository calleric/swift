//
//  ThumbView.swift
//  AngularGradientApp
//
//  Created by Eric Callanan on 10/06/2023.
//

import SwiftUI

struct ThumbView: View {
    @State private var startAngle = Angle(degrees: 0)
    @State private var endAngle = Angle(degrees: 230)

    var body: some View {
        ZStack {
            Color(hue: 0.58, saturation: 0.17, brightness: 1.0)
                .edgesIgnoringSafeArea(.all)
            VStack {
                ZStack {
                    Circle()
                        .trim(from: startAngle.degrees/360.0,
                              to: endAngle.degrees/360.0)
                        .stroke(AngularGradient(colors: AppColors.rainbow,
                                                      center: .center,
                                                     startAngle: startAngle,
                                                     endAngle: endAngle),
                                      style: StrokeStyle(lineWidth: 40,
                                                         lineCap: .round))
                        .rotationEffect(Angle(degrees: 80))
                        .padding(20)
                        .frame(width: 300, height: 300)

                    Circle()
                        .trim(from: startAngle.degrees/360.0,
                              to: endAngle.degrees/360.0)
                        .stroke(AngularGradient(colors: AppColors.oneColor,
                                                      center: .center,
                                                     startAngle: startAngle,
                                                     endAngle: endAngle),
                                      style: StrokeStyle(lineWidth: 40,
                                                         lineCap: .round))
                        .rotationEffect(Angle(degrees: 30))
                        .padding(20)
                        .frame(width: 220, height: 220)

                }
            }
            .padding()
        }
    }
}

struct ThumbView_Previews: PreviewProvider {
    static var previews: some View {
        ThumbView()
    }
}
