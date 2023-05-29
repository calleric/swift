//
//  PointCoordinateView.swift
//  LinearGradientApp
//
//  Created by Eric Callanan on 23/05/2023.
//

import SwiftUI

struct PointCoordinateView: View {
    var body: some View {
        VStack(spacing: 30) {
            Text("Point Coordinates")
                .font(.largeTitle)
                .fontWeight(.bold)
            Divider()
            
            VStack(spacing: 0) {
                Text("Start Point: (0.6, 0.2)  ")
                    .font(.title)
                Text("End Point: (0.2, 0.6)  ")
                    .font(.title)

                RoundedRectangle(cornerRadius: 20)
                    .fill(
                        LinearGradient(colors: AppColors.twoColors,
                                       startPoint: UnitPoint(x: 0.6, y: 0.2),
                                       endPoint: UnitPoint(x: 0.2, y: 0.6))
                    )
                    .frame(width: 200, height: 200)
            }
            Divider()

            VStack(spacing: 0) {
                Text("Start Point: (0.7, 0.5)  ")
                    .font(.title)
                Text("End Point: (0.9, 0.5)  ")
                    .font(.title)
                RoundedRectangle(cornerRadius: 20)
                    .fill(
                        LinearGradient(colors: AppColors.rainbow,
                                       startPoint: UnitPoint(x: 0.7, y: 0.5),
                                       endPoint: UnitPoint(x: 0.9, y: 0.5))
                    )
                    .frame(width: 200, height: 200)
            }
            
            Spacer()
        }
    }
}

struct PointCoordinateView_Previews: PreviewProvider {
    static var previews: some View {
        PointCoordinateView()
    }
}
