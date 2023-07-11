//
//  RainbowView.swift
//  RadialGradientApp
//
//  Created by Eric Callanan on 08/07/2023.
//

import SwiftUI

struct RainbowView: View {
    var body: some View {
        VStack(spacing: 100) {
            RoundedRectangle(cornerRadius: 20)
                .fill(
                    RadialGradient(colors: AppColors.rainbowClear.reversed(),
                                   center: .bottom,
                                   startRadius: 150,
                                   endRadius: 200)
                )
                .frame(width: 400, height: 200)


            RoundedRectangle(cornerRadius: 20)
                .fill(
                    RadialGradient(colors: AppColors.rainbowClear.reversed(),
                                   center: UnitPoint(x: 0.5, y: 1.6),
                                   startRadius: 150,
                                   endRadius: 300)
                )
                .frame(width: 400, height: 200)
        }
    }
}


















struct RainbowView_Previews: PreviewProvider {
    static var previews: some View {
        RainbowView()
    }
}
