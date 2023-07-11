//
//  HypnoticView.swift
//  RadialGradientApp
//
//  Created by Eric Callanan on 08/07/2023.
//

import SwiftUI

struct HypnoticView: View {
    @State private var colorIndex = 0
    @State private var colors = AppColors.rainbow
    
    let timer = Timer.publish(every: 0.12,
                              on: .main,
                              in: .common).autoconnect()
    func colorList() -> [Color] {
        colorIndex += 1
        return AppColors.rainbow.indices.map  { AppColors.rainbow.wrap(index: (colorIndex - $0)) }
    }
    
    var body: some View {
        VStack(alignment: .trailing) {
            
            Circle()
                .fill(
                    RadialGradient(colors: colors,
                                   center: .center,
                                   startRadius: 10,
                                   endRadius: 200)
                )
                .animation(Animation.easeInOut.speed(0.12),
                           value: colorIndex)
                .frame(width: 400, height: 400)
                .onReceive(timer) { _ in
                    colors = colorList()
                }
        }
    }
}

struct HypnoticView_Previews: PreviewProvider {
    static var previews: some View {
        HypnoticView()
    }
}

