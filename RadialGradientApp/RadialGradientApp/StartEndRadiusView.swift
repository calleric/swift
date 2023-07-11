//
//  StartEndRadiusView.swift
//  RadialGradientApp
//
//  Created by Eric Callanan on 08/07/2023.
//

import SwiftUI

struct StartEndRadiusView: View {
    var body: some View {
        VStack(spacing: 30) {
            Text("Start and End Radius")
                .font(.title)
                .fontWeight(.bold)
            
            VStack(alignment: .trailing) {
                HStack {
                    Spacer()
                    VStack(alignment: .trailing)  {
                        Text("Start Radius =   0")
                        Text("End Radius = 50")
                    }
                    RoundedRectangle(cornerRadius: 20)
                        .fill(
                            RadialGradient(colors: AppColors.rainbow,
                                           center: .center,
                                           startRadius: 0,
                                           endRadius: 50)
                        )
                        .frame(width: 200, height: 200)
                }
            }
            
            VStack(alignment: .trailing) {
                HStack {
                    Spacer()
                    VStack(alignment: .trailing)  {
                        Text("Start Radius =   50")
                        Text("End Radius = 150")
                    }
                    RoundedRectangle(cornerRadius: 20)
                        .fill(
                            RadialGradient(colors: AppColors.rainbow,
                                           center: .center,
                                           startRadius: 50,
                                           endRadius: 150)
                        )
                        .frame(width: 200, height: 200)
                }
            }
            
            VStack(alignment: .trailing) {
                HStack {
                    Spacer()
                    VStack(alignment: .trailing)  {
                        Text("Center = (0.2, 0.8)")
                        Text("Start Radius =   0")
                        Text("End Radius = 50")
                    }
                    RoundedRectangle(cornerRadius: 20)
                        .fill(
                            RadialGradient(colors: AppColors.rainbow,
                                           center: UnitPoint(x: 0.2, y: 0.8),
                                           startRadius: 0,
                                           endRadius: 50)
                        )
                        .frame(width: 200, height: 200)
                }
            }

            Spacer()
            
        }
        .padding()
    }
}

struct StartEndRadiusView_Previews: PreviewProvider {
    static var previews: some View {
        StartEndRadiusView()
    }
}
