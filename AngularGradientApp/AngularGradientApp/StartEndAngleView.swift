//
//  StartEndAngleView.swift
//  AngularGradientApp
//
//  Created by Eric Callanan on 10/06/2023.
//

import SwiftUI

struct StartEndAngleView: View {
    var body: some View {
        VStack(spacing: 30) {
            Text("Start and End Angle")
                .font(.title)
                .fontWeight(.bold)
            
            VStack(alignment: .trailing) {
                HStack {
                    Spacer()
                    VStack(alignment: .trailing)  {
                        Text("Start Angle =   0")
                        Text("End Angle = 90")
                    }
                    RoundedRectangle(cornerRadius: 20)
                        .fill(
                            AngularGradient(colors: AppColors.rainbow,
                                            center: .center,
                                            startAngle: Angle(degrees: 0),
                                            endAngle: Angle(degrees: 90))
                        )
                        .frame(width: 200, height: 200)
                }
            }
            
            VStack(alignment: .trailing) {
                HStack {
                    Spacer()
                    VStack(alignment: .trailing)  {
                        Text("Start Angle = -90")
                        Text("End Angle =   90")
                    }
                    RoundedRectangle(cornerRadius: 20)
                        .fill(
                            AngularGradient(colors: AppColors.rainbow,
                                            center: .center,
                                            startAngle: Angle(degrees: -90),
                                            endAngle: Angle(degrees: 90))
                        )
                        .frame(width: 200, height: 200)
                }
            }
            
            VStack(alignment: .trailing) {
                HStack {
                    Spacer()
                    VStack(alignment: .trailing)  {
                        Text("Center = (0.2, 0.8)")
                        Text("Start Angle =          -90")
                        Text("End Angle =            90")
                    }
                    RoundedRectangle(cornerRadius: 20)
                        .fill(
                            AngularGradient(colors: AppColors.rainbow,
                                            center: UnitPoint(x: 0.2, y: 0.8),
                                            startAngle: Angle(degrees: -90),
                                            endAngle: Angle(degrees: 90))
                        )
                        .frame(width: 200, height: 200)
                }
            }

            Spacer()
            
        }
        .padding()
    }
}

struct StartEndAngleView_Previews: PreviewProvider {
    static var previews: some View {
        StartEndAngleView()
    }
}
