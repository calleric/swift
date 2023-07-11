//
//  AnimateCenterView.swift
//  RadialGradientApp
//
//  Created by Eric Callanan on 08/07/2023.
//

import SwiftUI

struct AnimateCenterView: View {
    @State private var centerPointIndex = 4
    
    let timer = Timer.publish(every: 2,
                              on: .main,
                              in: .common).autoconnect()
    
    var body: some View {
        VStack {
            Text("Move center")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Rectangle()
                .fill(
                    RadialGradient(colors: AppColors.rainbow,
                                   center: UnitPointType.allCases[centerPointIndex].unitPoint,
                                   startRadius: 5,
                                   endRadius: 250)
                )
                .animation(Animation.easeInOut.speed(0.2),
                           value: centerPointIndex)
                .frame(width: 400, height: 400)
                .onReceive(timer) { input in
                    centerPointIndex = (centerPointIndex + 1) % UnitPointType.allCases.count
                }
            
            
            VStack(alignment: .leading)  {
                HStack() {
                    Text("center: ")
                    Text(" \(UnitPointType.allCases[centerPointIndex].rawValue)")
                        .animation(Animation.easeInOut.speed(0.6),
                               value: centerPointIndex)
                    Spacer()
                }
                .padding()
                .font(.title)
                .fontWeight(.bold)
            }
            
            Spacer()
        }
        .padding()
    }
}

struct AnimateCenterView_Previews: PreviewProvider {
    static var previews: some View {
        AnimateCenterView()
    }
}
